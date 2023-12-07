syn:
	BASENAME=fir \
	CLOCKPERIOD=2 \
        TIMINGLIBS='/opt/cadence/libraries/gsclib045_all_v4.7/gsclib045/timing/fast_vdd1v2_basicCells.lib' \
	CORENETLIST='../syn/outputs/fir_netlist.v' \
        LEF='/opt/cadence/libraries/gsclib045_all_v4.7/gsclib045/lef/gsclib045_tech.lef /opt/cadence/libraries/gsclib045_all_v4.7/gsclib045/lef/gsclib045_macro.lef' \
        QRC='/opt/cadence/libraries/gsclib045_all_v4.7/gsclib045/qrc/qx/gpdk045.tch' \
        genus -f run_genus.tcl

layout:
	innovus -stylus -files run_innovus.tcl

clean:
	rm -rf reports syndb synout *~ innovus.cmd* innovus.log* genus.cmd* genus.log* RPT out synthDb fv rc_model.bin *.rpt qrc*.log extLogDir

