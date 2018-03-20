require 'open-uri'
require 'nokogiri'
require 'json' 

paginas 	=	['/posts/Swine-Flu/Swine-Flue--Atrial-Fibrillation/show/1100914',
'/posts/Asthma/swine-flue-and-asthma/show/1103407',
'/posts/Lyme-Disease/Swine-flue-questions--Worried/show/940021',
'/posts/Asthma/H1N1swine-flue/show/1011922',
'/posts/Swine-Flu/COPD-and-Swine-flue/show/1041734',
'/posts/Complementary-Medicine/alternative-medicine-for-flue/show/1480957',
'/posts/Senior-Health/cold-or-flue/show/1434174',
'/posts/Pregnancy-Aug-2009-Babies/Flue-and-pregnancy/show/726182',
'/posts/STDs---STIs/STD-and-Flue/show/1879127',
'/posts/Pregnancy-Ages-18-24-/TMI-Stomach-flue-dispersing-/show/2648072',
'/posts/Pregnancy-Ages-18-24-/Tylenol-cold-and-flue-/show/2277517',
'/posts/Pregnancy-Ages-25-34/The-flue-or-cold-/show/2795856',
'/posts/Pregnancy-Social/Flue/show/2444843',
'/posts/Undiagnosed-Symptoms/Flue-/show/2962748']

#file = File.open('links.txt')
#file.each_line do |line|


paginas.each do |pagines|
	
	url = "https://www.medhelp.org#{pagines}"

	document = open(url)
	content = document.read
	parsed_content = Nokogiri::HTML(content)

	parsed_content.css('.new_header').css('.background_changeable._bg').each do |heads|
	 	 title 			= heads.css('.question_title.hn_16b').inner_text
	 	 question_title = heads.css('.post_message.trunc_msg.fonts_resizable.os_14').inner_text
	 	 answare 		= heads.css('.post_message_container').css('.post_message').inner_text
	 	 teste			= heads.css('.post_message_container').css('.post_message').inner_text
	 	#teste = heads.css('.post_message_container').css('.post_message').css('div#id')[0] #tentar colocar id do post
	 	 votes 			= heads.css('.tertiary_btn_ctn').css('.rating').css('.user_rating.mh_tertiary_btn').inner_text

	 	  puts '--question-----------'
	 	  puts title
	 	  puts question_title
	 	  puts '-------------'
	 	  puts '--answare----'
	 	  puts answare
	 	  puts "#{votes} #{votes}" 
 	
	out = File.new("output.txt", "w")
	out.puts '--question-----------'
	out.puts title
	out.puts question_title
	out.puts '-------------'
	out.puts '--answare----'
	out.puts answare
	out.puts "#{votes} #{votes}" 
	out.close

		end
#end
end


