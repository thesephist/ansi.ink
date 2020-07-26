std := load('vendor/std')

log := std.log
each := std.each
max := std.max

ansi := load('ansi')

Weight := ansi.Weight
Color := ansi.Color
Background := ansi.Background
MoveColumn := ansi.MoveColumn
style := ansi.style

MaxLabelLength := 18

out(ansi.Clear)
each(keys(Weight), weight => (
	wgt := Weight.(weight)
	each(keys(Color), color => (
		clr := Color.(color)
		bg := Background.(color)
		log(
			MoveColumn(MaxLabelLength - 2 - len(weight + ' ' + color)) +
				style(wgt, clr)(weight + ' ' + color) +
				MoveColumn(MaxLabelLength) +
				style(wgt, bg)(weight + ' Background' + color)
		)
	))
))

