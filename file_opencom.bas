/' open COMx '/

#include "fb.bi"

extern "C"
/':::::'/
function fb_FileOpenCom FBCALL ( str_filename as FBSTRING ptr, mode as ulong, access_ as ulong, _lock as ulong, fnum as long, _len as long, _encoding as const ubyte ptr ) as long
    if ( FB_FILE_INDEX_VALID( fnum ) = NULL ) then
    	return fb_ErrorSetNum( FB_RTERROR_ILLEGALFUNCTIONCALL )
	end if
    
    return fb_FileOpenVfsEx( FB_FILE_TO_HANDLE(fnum), _
                             str_filename, _
                             mode, _
                             access_, _
                             _lock, _
                             _len, _
                             fb_hFileStrToEncoding( _encoding ), _
                             @fb_DevComOpen )
end function
end extern