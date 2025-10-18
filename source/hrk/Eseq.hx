package hrk;

import mikolka.vslice.components.crash.Logger;
import mikolka.compatibility.VsliceOptions;

class Eseq {
    public static var available(get, never):Bool;
    public static function get_available() {
		try {
			Sys.stdout().writeString("");
            Sys.stdout().flush();
            return true;
		} catch (e:Dynamic) return false;
    }

    public static function p(d:Dynamic = null) {
        if (VsliceOptions.LOGGING.contains("Console")) {
            Sys.stdout().writeString(d);
            Sys.stdout().flush();
        }
        // if (VsliceOptions.LOGGING.contains("File")) {
        //     @:privateAccess
        //     var file = Logger.file;
        //     if (file != null) {
        //         file.writeString(d+"\n");
        //         file.flush();
        //     }
        // }
    }
}