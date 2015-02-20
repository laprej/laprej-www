suppressPackageStartupMessages(require(RMySQL))
suppressPackageStartupMessages(require(sqldf))
suppressPackageStartupMessages(require(ggplot2))
suppressPackageStartupMessages(require(reshape))
suppressPackageStartupMessages(require(plyr))
options(RMySQL.dbname="claret") # (rest comes from $HOME/.my.cnf)

db <- function(query, factors=c(), numeric=c()) {
  d <- sqldf(query)
  d[factors] <- lapply(d[factors], factor)
  d[numeric] <- lapply(d[numeric], as.numeric)
  return(d)
}

capply <- function(col, func) unlist(lapply(col, func))

num <- function(var) as.numeric(as.character(var))

save <- function(g, name=FILE_BASE, file=sprintf("%s/%s.pdf",FILE_DIR,name), w=3.3, h=3.1) {
  ggsave(plot=g, filename=file, width=w, height=h)
  print(sprintf("saved: %s", file))
}

prettify <- function(str) gsub('_',' ',gsub('([a-z])([a-z]+)',"\\U\\1\\E\\2",str,perl=TRUE))

regex_match <- function(reg,str) length(grep(reg,str)) > 0

label_pretty <- function(variable, value) {
  vname <- if (regex_match('variable|value',variable)) '' else sprintf('%s:', variable)
  lapply(paste(vname, prettify(as.character(value))), paste, collapse="\n")
}

geom_mean <- function(geom) stat_summary(fun.y='mean', geom=geom, labeller=label_pretty)

geom_meanbar <- function(labeller=label_pretty) {
  return(list(
    stat_summary(fun.y=mean, geom='bar', position='dodge'),
    stat_summary(fun.data=mean_cl_normal, geom='errorbar', width=0.2, position='dodge')
  ))
}

c.blue   <- "#0072B2"
c.yellow <- "#E69F00"
c.green  <- "#009E73"
c.red    <- "#D55E00"
c.pink   <- "#CC79A7"
c.gray   <- "#999999"

# The palette with grey:
cbPalette <- c(c.blue, c.yellow, c.green, c.red, c.pink, "#56B4E9", "#F0E442", c.gray)

theme_mine <- list(
  # To use for fills, add
  scale_fill_manual(values=cbPalette),
  # To use for line and point colors, add
  scale_colour_manual(values=cbPalette),
  # basic black and white theme
  theme(
    panel.background = element_rect(fill="white"),
    panel.border = element_rect(fill=NA, color="grey50"),
    panel.grid.major = element_line(color="grey80", size=0.2),
    panel.grid.minor = element_line(color="grey90", size=0.2),
    strip.background = element_rect(fill="grey90", color="grey50"),
    strip.background = element_rect(fill="grey80", color="grey50"),
    axis.ticks = element_line(colour="black"),
    panel.grid = element_line(colour="black"),
    axis.text.y = element_text(colour="black"),
    axis.text.x = element_text(colour="black"),
    text = element_text(size=9, family="Helvetica")
  )
)

cc_scales <- function(field=cc, title="Concurrency control:") list(
  scale_fill_manual(values=my_palette, name=title),
  scale_color_manual(values=my_palette, name=title),
  scale_linetype_manual(name=title, values=c('commutative'=1,'reader/writer'=2))
)

claret_data <- function(where="") {
  d <- db(paste("SELECT * FROM tapir WHERE total_time is not null AND ", where))

  d$failure_rate <- d$txn_failed / (d$txn_count + d$txn_failed)
  d$throughput <- d$txn_count * num(d$nclients) / d$total_time
  # d$throughput <- d$ntxns * num(d$nclients) / d$total_time
  d$avg_latency_ms <- d$txn_time / d$txn_count * 1000
  
  d$prepare_total <- d$prepare_retries + d$txn_count
  d$prepare_retry_rate <- d$prepare_retries / d$prepare_total
  
  d$ccf <- factor(d$ccmode, levels=c('simple','rw','bottom'))
  
  d$cc <- factor(revalue(d$ccmode, c(
    # 'bottom'='base',
    'rw'='reader/writer',
    'simple'='commutative'
  )), levels=c('commutative','reader/writer','base'))
  d$`Concurrency Control` <- d$cc
  
  d$Graph <- capply(d$gen, function(s) gsub('kronecker:.+','kronecker',s))
  
  d$workload <- factor(revalue(d$mix, c(
    'geom_repost'='repost-heavy',
    'read_heavy'='read-heavy',
    'update_heavy'='mixed'
  )), levels=c('read-heavy', 'repost-heavy', 'mixed'))
  
  d$zmix <- sprintf('%s/%s', d$mix, d$alpha)
  
  d$facet <- sprintf('shards: %d\n%s\n%d users\n%s', num(d$nshards), d$zmix, d$initusers, d$Graph)

  d$gen_label <- sprintf('%d users\n%s', d$initusers, d$Graph)
  
  return(d)
}
