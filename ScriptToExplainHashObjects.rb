BEGIN {
	playerData = File.open("playerData.rb", "w")
	# One
	print "Enter player name one:"
	summonerNameOne = gets.chomp #chomp to remove newline
	print "Enter preferred role one:"
	preferredRoleOne = gets.chomp
	# Two
	print "Enter player name two:"
	summonerNameTwo = gets.chomp #chomp to remove newline
	print "Enter preferred role two:"
	preferredRoleTwo = gets.chomp
	# Three
	print "Enter player name three:"
	summonerNameThree = gets.chomp #chomp to remove newline
	print "Enter preferred role three:"
	preferredRoleThree = gets.chomp
	# Four
	print "Enter player name four:"
	summonerNameFour = gets.chomp #chomp to remove newline
	print "Enter preferred role four:"
	preferredRoleFour = gets.chomp
	# Five
	print "Enter player name five:"
	summonerNameFive = gets.chomp #chomp to remove newline
	print "Enter preferred role five:"
	preferredRoleFive = gets.chomp

	playerData.write({
	"#{summonerNameOne}" => "#{preferredRoleOne}",
	"#{summonerNameTwo}" => "#{preferredRoleTwo}",
	"#{summonerNameThree}" => "#{preferredRoleThree}",
	"#{summonerNameFour}" => "#{preferredRoleFour}",
	"#{summonerNameFive}" => "#{preferredRoleFive}",
	})
	playerData.close
	playerData = File.open("playerData.rb", "r") # Must have the file open in r to read
	contents = playerData.read
	puts "\n print contents of playerData.rb"
	print contents
	playerData.close
}
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
	"#{summonerNameOne}" => ["top","jg","top"],
	"#{summonerNameTwo}" => ["jg","jg","top"],
	"#{summonerNameThree}" => ["mid","mid","top"],
	"#{summonerNameFour}" => ["adc","adc","supp"],
	"#{summonerNameFive}" => ["supp","supp","top"]
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

Player.giveRole(summonerNameOne, preferredRoleOne)
Player.placeOnTeam(summonerNameOne)

Player.giveRole(summonerNameTwo, preferredRoleTwo)
Player.placeOnTeam(summonerNameTwo)

Player.giveRole(summonerNameThree, preferredRoleThree)
Player.placeOnTeam(summonerNameThree)

Player.giveRole(summonerNameFour, preferredRoleFour)
Player.placeOnTeam(summonerNameFour)

Player.giveRole(summonerNameFive, preferredRoleFive)
Player.placeOnTeam(summonerNameFive)

puts " \n puts $team"
puts $team
