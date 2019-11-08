class AttendanceMailer < ApplicationMailer

	default from: 'no-reply@my_eventbrite.fr'

	def event_registration(user)
		#on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
		@user = user

		#on définit une variable @url qu'on utilisera dans la view d’e-mail
		@url  = 'http://my_eventbrite.fr/event'

		# c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
		mail(to: @user.email, subject: 'Nouvelle inscription à votre évènement !') 
	end

end
