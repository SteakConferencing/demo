extensions = {}

extensions.conference = {
  ["trunk_incoming"] = function(c, e)
  	app.playback("beep")

	  app.read("room", "conf-getconfno", 3)
	  room = channel["room"]:get()
	  if room == nil then
	    app.playback("beepErr")
	    app.hangup()
	  end

	  app.verbose("Conference room " .. room .. ": " .. channel.CALLERID("num"):get() .. " entering")
	  app.playback("conf-enteringno")
	  app.sayDigits(room, "f")

	  app.confBridge(room)
  end;

  ["_XXX"] = function(c, e)
	  app.answer()
	  app.playback("beep")
	  app.verbose("Conference room " .. e .. ": " .. channel.CALLERID("num"):get() .. " entering")
	  app.playback("conf-enteringno")
	  app.sayDigits(e, "f")
	  app.confBridge(e)
  end
}
