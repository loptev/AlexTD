class HomeController < ApplicationController

	def homepage
		@highscores = User.all.select("username, highscore").order("highscore DESC").first(10)
	end
	def scoreboard
		@highscores = User.where("highscore > ?", 0).select("username, highscore").order("highscore DESC")
	end
end
