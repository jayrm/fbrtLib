/' low-level truncate / set end of file '/

#include "../fb.bi"
#include "windows.bi"

extern "C"

function fb_hFileSetEofEx( f as FILE ptr ) as long

	dim as long errorCode = iif ( _
		SetEndOfFile( cast(HANDLE, _get_osfhandle( _fileno( f ) ) ) ) = 0, ) then
		FB_RTERROR_FILEIO, _
		FB_RTERROR_OK _
	)

	return fb_ErrorSetNum( errorCode )
	
end function

end extern
