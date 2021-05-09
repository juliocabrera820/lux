module Lux
  module Utils
    class ErrorBuilder
      def self.build_error_block(user_name)
        [
          {
            "type": "context",
            "elements": [
              {
                "type": "mrkdwn",
                "text": "*Hubo un error* :cry:"
              },
         	 	  {
	  		    	  "type": "image",
  		  		 	  "image_url": "https://pbs.twimg.com/profile_images/625633822235693056/lNGUneLX_400x400.jpg",
    			  	  "alt_text": "cute cat"
      			 	},
           	 	{
	  		      	"type": "image",
		  		 	    "image_url": "https://pbs.twimg.com/profile_images/625633822235693056/lNGUneLX_400x400.jpg",
  			  	    "alt_text": "cute cat"
       			 	},
           	 	{
	  		      	"type": "image",
		  		 	    "image_url": "https://pbs.twimg.com/profile_images/625633822235693056/lNGUneLX_400x400.jpg",
  			  	    "alt_text": "cute cat"
       			 	},
              {
                "type": "mrkdwn",
                "text": "#{user_name} *no existe* :space_invader:"
              }
            ]
          }
        ]
      end
    end
  end
end
