MacroPath = "C:\\Users\\dani\\Dropbox (Personal)\\____Recovery\\Fiji.app\\Custom_Codes\\CenClusterQuant\\src";
MacroName = "CenClusterQuant.ijm";
printIMname = 0;		// set to 0 or 1 depending on whether you want image name printed to log


run ("Close All");	print ("\\Clear");
dir = getDirectory ("Choose a Directory");
print(MacroName, "==>" , dir);


filelist = getFileList (dir);
for (f = 0; f < filelist.length; f++) {
	filename = filelist [f];
	if ( endsWith (filename, ".tif") || endsWith (filename, ".dv") ){
		open ( dir + filename );
		ori = getTitle ();
		RunCode (ori);
		run ("Close All"); 	run("Collect Garbage");
	}
}
print ("All done");


function RunCode(IM){
	if (printIMname == 1)	print(IM);
	runMacro(MacroPath + File.separator + MacroName);

}
