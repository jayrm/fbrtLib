/' dynamic arrays core '/

#include "fb.bi"

extern "C"
function fb_hArrayCalcElements ( dimensions as size_t, lboundTB as const ssize_t ptr, uboundTB as const ssize_t ptr ) as size_t
	dim as size_t i, elements

	elements = (uboundTB[0] - lboundTB[0]) + 1
	i = 1
	while( i < dimensions )
		elements *= (uboundTB[i] - lboundTB[i]) + 1
		i += 1
	wend

	return elements
end function

function fb_hArrayCalcDiff ( dimensions as size_t, lboundTB as const ssize_t ptr, uboundTB as const ssize_t ptr ) as ssize_t
	dim as size_t i, elements
	dim as ssize_t diff = 0

	if ( dimensions <= 0 ) then
		return 0
	end if
	
	i = 0
	while( i < dimensions - 1 )
		elements = (uboundTB[i+1] - lboundTB[i+1]) + 1
		diff = (diff + lboundTB[i]) * elements
		i += 1
	wend

	diff += lboundTB[dimensions-1]

	return -diff
end function
end extern