/' instranyw function '/

#include "fb.bi"

extern "C"
function fb_WstrInstrAny FBCALL ( start as ssize_t, src as const FB_WCHAR ptr, patt as const FB_WCHAR ptr ) as ssize_t
	dim as ssize_t r = 0

	if ( (src <> NULL) andalso (patt <> NULL) ) then
		dim as ssize_t size_src = fb_wstr_Len( src )

		if ( (start > 0) andalso (start <= size_src) ) then
			r = fb_wstr_InstrAny( @src[start-1], patt ) + start

			if ( r > size_src ) then
				r = 0
			end if
		end if
	end if

	return r
end function
end extern