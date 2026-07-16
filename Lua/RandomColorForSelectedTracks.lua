colors = {
	{ 255, 0, 0 },     -- Red
	{ 0, 180, 0 },     -- Green
	{ 0, 100, 255 },   -- Blue
	{ 255, 240, 0 },   -- Yellow
	{ 255, 140, 0 },   -- Orange
	{ 180, 0, 255 },   -- Purple
	{ 0, 220, 220 },   -- Cyan
	{ 255, 50, 150 },  -- Pink
	{ 220, 220, 220 }, -- White
	{ 160, 30, 30 },   -- Dark Red
	{ 30, 60, 160 },   -- Dark Blue
	{ 0, 160, 160 },   -- Teal
}

selected_tracks = reaper.CountSelectedTracks(0)
if selected_tracks == 0 then
	reaper.ShowMessageBox("No tracks selected", "Random Color", 0)
	return
end

math.randomseed(os.time())

for i = 0, selected_tracks - 1 do
	track = reaper.GetSelectedTrack(0, i)
	c = colors[math.random(#colors)]
	color = c[1] | (c[2] << 8) | (c[3] << 16) | (1 << 24)
	reaper.SetMediaTrackInfo_Value(track, "I_CUSTOMCOLOR", color)
end

reaper.UpdateArrange()
