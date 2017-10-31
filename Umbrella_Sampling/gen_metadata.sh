###############################################################################
#									      #	
#	Generates a metadatafile according to the WHAM documentation	      #
#									      #
#	VERY IMPORTANT NOTE NUMBER 1:					      #
#									      #
#	Make sure that the 'spring' value is HALF the one used		      #
#	during the GROMACS run 		 				      #
#									      #
#	VERY IMPORTANT NOTE NUMBER 2:					      #
#									      #
#	Check your metadata file AFTER running this script.		      #
#	Though it is designed to work flawlessly, it might not.		      #
#									      #
#	Script created by Naushad AL Velgy.				      #
#	Any queries, email naushad.velgy@dtc.ox.ac.uk			      #
#									      #
###############################################################################

for file in $(ls *trunc | sort -n -t _ -k 2) ;

do

AT=$(echo $file | cut -d'_' -f2);

echo $file $AT 50.0 >> metadata;

done
