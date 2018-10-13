#!/usr/bin/env bash
cd

cd /home/pi/Desktop/R/us_macro_data/

sudo rm -r ./Plots/*.*

sudo git pull 

sudo Rscript main.R

sudo cp ~/Desktop/R/us_macro_data/Plots/*.pdf	~/Desktop/tex/us_plot/

texliveonfly ~/Desktop/tex/us_plot/plots.tex

echo ' ' | mailx -s 'TR database and estimates updated' -A ~/Desktop/R/tex/us_plot/plots.pdf emanuele.franceschi@gmail.com

sudo zip /var/www/html/files/us_macro_data.zip ./Processed\ data/*.txt -j

sudo mv /home/pi/Desktop/tex/us_plot/us_plot.pdf /var/www/html/files/us_plot.pdf










% !TeX spellcheck = en_GB
\documentclass[a4paper,10pt]{article}

\usepackage[english]{babel}
\usepackage[utf8]{inputenc}
\usepackage{mathtools}
\usepackage{graphicx}
\usepackage{dsfont} 
\usepackage{amssymb}
\usepackage[colorlinks=true, linkcolor=blue, bookmarks=false, citecolor=red, urlcolor=blue]{hyperref}
\hypersetup{pdfstartview=FitH}
\usepackage[super]{nth} %automatic -th for dates
\usepackage{lipsum} %filler
\usepackage{fullpage} %margins 
\usepackage[affil-it]{authblk} %affiliation package

% rotating pages for big tables
\usepackage{pdflscape}

% floating obj (img, tbl)
\usepackage{float}



\title{
US Economy data
}
\author[1]{\href{mailto:emanuele.franceschi@psemail.eu}{Emanuele Franceschi}}


\date{\today}
\affil[1]{PSE - Paris School of Economics, Université Paris 1 Panthéon-Sorbonne}



\begin{document}
\section{Real economy}

\begin{figure}
	\centering
	\includegraphics[keepaspectratio,width=\textwidth]{output_slack}
	\caption{Measures of output slack}
\end{figure}

\section{Inflation, money, finance}

\begin{figure}
	\centering
	\includegraphics[keepaspectratio,width=\textwidth]{rev_infl}
	\caption{Revised measures of inflation}
\end{figure}

\begin{figure}
	\centering
	\includegraphics[keepaspectratio,width=\textwidth]{inflation_nowcast}
	\caption{Inflation nowcast}
\end{figure}


\begin{figure}
	\centering
	\includegraphics[keepaspectratio,width=\textwidth]{inflation_forecast}
	\caption{Inflation forecast}
\end{figure}


\begin{figure}
	\centering
	\includegraphics[keepaspectratio,width=\textwidth]{spreads}
	\caption{Spreads}
\end{figure}


\begin{figure}
	\centering
	\includegraphics[keepaspectratio,width=\textwidth]{money}
	\caption{Money aggregates}
\end{figure}


\section{Survey of Professional Forecasters}

\begin{figure}
	\centering
	\includegraphics[keepaspectratio,width=\textwidth]{SPF_infl_forecasts}
	\caption{SPF inflation forecast}
\end{figure}


\begin{figure}
	\centering
	\includegraphics[keepaspectratio,width=\textwidth]{disagreement_inf_forecasts}
	\caption{Disagreement in SPF forecasts}
\end{figure}


\end{document}