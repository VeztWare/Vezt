function AddTag(plr, tag, color)
	local Players = game:GetService("Players")
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local Plr = plr
	local ChatTag = {}
	ChatTag[Plr] =
		{
			TagText = tag, --Text
			TagColor = color, --Rgb
			NameColor = color
		}



	local oldchanneltab
	local oldchannelfunc
	local oldchanneltabs = {}

	--// Chat Listener
	for i, v in pairs(getconnections(ReplicatedStorage.DefaultChatSystemChatEvents.OnNewMessage.OnClientEvent)) do
		if
			v.Function
			and #debug.getupvalues(v.Function) > 0
			and type(debug.getupvalues(v.Function)[1]) == "table"
			and getmetatable(debug.getupvalues(v.Function)[1])
			and getmetatable(debug.getupvalues(v.Function)[1]).GetChannel
		then
			oldchanneltab = getmetatable(debug.getupvalues(v.Function)[1])
			oldchannelfunc = getmetatable(debug.getupvalues(v.Function)[1]).GetChannel
			getmetatable(debug.getupvalues(v.Function)[1]).GetChannel = function(Self, Name)
				local tab = oldchannelfunc(Self, Name)
				if tab and tab.AddMessageToChannel then
					local addmessage = tab.AddMessageToChannel
					if oldchanneltabs[tab] == nil then
						oldchanneltabs[tab] = tab.AddMessageToChannel
					end
					tab.AddMessageToChannel = function(Self2, MessageData)
						if MessageData.FromSpeaker and Players[MessageData.FromSpeaker] then
							if ChatTag[Players[MessageData.FromSpeaker].Name] then
								MessageData.ExtraData = {
									NameColor = ChatTag[Players[MessageData.FromSpeaker].Name].NameColor
										or Players[MessageData.FromSpeaker].TeamColor.Color,
									Tags = {
										table.unpack(MessageData.ExtraData.Tags),
										{
											TagColor = ChatTag[Players[MessageData.FromSpeaker].Name].TagColor,
											TagText = ChatTag[Players[MessageData.FromSpeaker].Name].TagText,
										},
									},
								}
							end
						end
						return addmessage(Self2, MessageData)
					end
				end
				return tab
			end
		end
	end
end

AddTag("IamNotHamza_GG","Owner👑🛠", Color3.fromRGB(255, 255, 0))
AddTag("VeztWare","Owner ALT", Color3.fromRGB(255, 255, 0))
AddTag("IamVerySUS","Recovery ALT", Color3.fromRGB(0, 255, 0))
AddTag("IGOTBANFROMCHASE_L", "Beta Tester✨", Color3.fromRGB(0, 255, 0))
