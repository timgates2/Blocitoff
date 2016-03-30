class FavoriteMailer < ApplicationMailer
    default from: "youremail@email.com"

    def time_update(remainder, start)
    
     headers["Message-ID"] = "<comments/#{comment.id}@your-app-name.example>"
     headers["In-Reply-To"] = "<post/#{post.id}@your-app-name.example>"
     headers["References"] = "<post/#{post.id}@your-app-name.example>"
    
    @remainder = remainder
    @start = start
    
    mail(to: user.emal, subject: "You have #{remainder.days} left on your To-Do list")
    end
end

