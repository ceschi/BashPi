#### Packages mgmt functions ####



# provides a re-usable txt list of the installed packages
# run this function in your pre-format R installation
pack_list <- function(){
  pax <- as.data.frame(installed.packages())
  pax <- as.character(pax$Package)
  write.table(pax, file.path(getwd(),'R_installation.txt'), row.names=F, col.names=F, sep=';')
}

# takes the output of pack_list to install back all the 
# previously installed packages
old_pax <- function(dir = FALSE){
	if (dir == FALSE){
	  pax <- read.table(file.choose())
	}
	else{
	  pax  <- read.table(file = file.path(dir))
	}
  here_already <- data.frame(installed.packages(), row.names = NULL, stringsAsFactors = F)
  
  new_pax <- setdiff(here_already$Package, pax[,1])
  new_pax <- as.data.frame(new_pax)
  
  update.packages(ask = F, type = 'source')
	apply(new_pax,1,install.packages, type = 'source')
	cat('\n\n\nPackages installation done! I installed ', NROW(new_pax), ' packages.')
}