MacroPath = "C:\\Users\\dani\\Dropbox (Personal)\\____Recovery\\Fiji.app\\Custom_Codes\\CenClusterQuant\\src";
MacroName = "CenClusterQuant.ijm";
printDIRname = 1;		// set to 0 or 1 depending on whether you want directory name printed to log
printIMname = 0;		// set to 0 or 1 depending on whether you want image name printed to log

run ("Close All");	print ("\\Clear");
dir = getDirectory ("Choose a Directory");
print(MacroName, "==>" , dir);

subdirs = getFileList (dir);
for (d = 0; d < subdirs.length; d++) {
	subdirname = dir + subdirs [d];
	if ( endsWith (subdirname, "/")){
		filelist = getFileList (subdirname);
		if (printDIRname == 1)	print(subdirname);
		for (f = 0; f < filelist.length; f++) {
			filename = subdirname + filelist [f];
			if ( endsWith (filename, ".tif") || endsWith (filename, ".dv") ){
				open ( filename );
				ori = getTitle ();
				RunCode (ori);
				run ("Close All"); 	run("Collect Garbage");
			}
		}
	}
}
print ("All done");

function RunCode(IM){
	if (printIMname == 1)	print(IM);
	runMacro(MacroPath + File.separator + MacroName);

	waitForUser(IM);
	
}