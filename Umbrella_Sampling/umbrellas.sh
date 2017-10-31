###############################################################################
#									      #	
#	Creates multiple AT values for simulation.			      #
#	Change the X in $(seq -3 X 3) to 				      #
#	increase/decrease the discretisation 				      #
#									      #
#	Script created by Naushad AL Velgy.				      #
#	Any queries, email naushad.velgy@dtc.ox.ac.uk			      #
#									      #
###############################################################################

for AT in $(seq -3 1 3)
do

cat > plumed.dat << EOF

phi: TORSION ATOMS=5,7,9,15
psi: TORSION ATOMS=7,9,15,17
#
# Impose an umbrella potential on CV 1 and CV 2
# with a spring constant of 50 kjoule/mol
# at fixed points on the Ramachandran plot
#
restraint-phi: RESTRAINT ARG=phi KAPPA=100.0 AT=$AT
# monitor the two variables and the bias potential from the two restraints
PRINT ARG=phi,psi,restraint-phi.bias FILE=COLVAR_$AT

EOF

mdrun -s topol.tpr -plumed plumed.dat -nsteps 250000 -x traj_$AT.xtc -v

done
