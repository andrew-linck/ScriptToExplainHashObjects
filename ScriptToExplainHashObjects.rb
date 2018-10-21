# Team Data
$team = Hash.new(5)

$team = {
	"top" => "",
	"jg" => "",
	"mid" => "",
	"supp" => "",
	"adc" => ""
}

# Player Data
$playerMostRecentGames = {
	"Doublelift" => ["top","jg","top"],
	"Blis" => ["jg","jg","top"],
	"Parakeeni" => ["mid","mid","top"],
	"Maxed" => ["adc","adc","supp"],
	"Illusion" => ["supp","supp","top"]
}

$playerPreferredRole = {
	"Parakeeni" => "",
	"Blis" => "",
	"Illusion" => "",
	"Maxed" => "",
	"Doublelift" => ""
}

# Module RoleGiver
module RoleGiver
	def giveRole(player, preferredrole)
		@mostRecent = $playerMostRecentGames.fetch(player)
		(preferredrole != "")? $playerPreferredRole[player] = preferredrole :
		case @mostRecent
		when ["top","jg","top"]
			$playerPreferredRole[player] = "top"
		when ["jg","jg","top"]
			$playerPreferredRole[player] = "jg"
		when ["mid","mid","top"]
			$playerPreferredRole[player] = "mid"
		when ["adc","adc","supp"]
			$playerPreferredRole[player] = "adc"
		when ["supp","supp","top"]
			$playerPreferredRole[player] = "supp"
		else
		end
	end
end


		# Module TeamPlacer
module TeamPlacer
		def placeOnTeam(player)
			@preferredRole = $playerPreferredRole.fetch(player)
			case @preferredRole
			when "top"
				$team["top"] = player
			when "jg"
				$team["jg"] = player
			when "mid"
				$team["mid"] = player
			when "supp"
				$team["supp"] = player
			when "adc"
				$team["adc"] = player
			else
		end
	end
end


# Class where modules are used and player and preferredRole can be passed through
class Player
	extend RoleGiver
	extend TeamPlacer
end

Player.giveRole("Parakeeni", "mid")
Player.placeOnTeam("Parakeeni")

Player.giveRole("Blis", "jg")
Player.placeOnTeam("Blis")

Player.giveRole("Doublelift", "")
Player.placeOnTeam("Doublelift")

Player.giveRole("Illusion", "")
Player.placeOnTeam("Illusion")

Player.giveRole("Maxed", "adc")
Player.placeOnTeam("Maxed")

puts $team
