module Api
  module V1
    class AirlinesController < ApplicationController
      def index
        airlines = Airline.all

        render AirlineSerializer.new(airlines, options).serialized_json
      end

      def show
        airline = airline.find_by(slug: param[:slug])
        render json: AirlineSerializer.new(airlines, options).serialized_json

      end

      def create
        airline = Airline.new(airline_params)

        if airline.save
          render json: AirlineSerializer.new(airlines).serialized_json
        else
          render json: {error: airline.errors.messages}, status: 422
        end
      end

      def update
        airline = Airline.find_by(slug: param[:slug])

        if airline.update(airline_params)
          render json: AirlineSerializer.new(airlines, options).serialized_json
        else
          render json: {error: airline.errors.messages}, status: 422
        end
      end

      def destroy
        airline = Airline.find_by(slug: param[:slug])

        if airline.destroy
          head :no_content
        else
          render json: {error: airline.errors.messages}, status: 422
        end
      end



      def airline_params
        params.require(:airline).permit(:name, :image_url)
      end

      def options

        #turning it into a compound document
        # AKA when we make a new instance of our airline serializer
         # so we can pass in an option hash and specify the additional resources we want to include in that
        #specify the resources we want to include
        @options || = {include: %i[reviews]}
      end
    end
  end
end
