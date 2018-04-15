class ClansController < ApplicationController

  def index

    if params['clanInput'][0] == '#'
      @input = params['clanInput'][1..8]
    end

    if params['clanInput'].nil?
        @input = params['playerInput']
        @response = RestClient.get 'https://api.clashofclans.com/v1/player/%23'+ @input, {:Authorization => 'Bearer '+ ENV["clashAPI"], :content_type => :json}{ |response, request, result, &block|
          case response.code

          when 200
            @response = response

          when 404
            redirect_to root_path, notice: 'Not a valid clan tag, try again'
            return
          end
        }
    elsif params['clanInput'][0] == '#'
        @input = params['clanInput'][1..8]
        @response = RestClient.get 'https://api.clashofclans.com/v1/clans/%23'+ @input +'/members', {:Authorization => 'Bearer ' + ENV["clashAPI"], :content_type => :json}{ |response, request, result, &block|
          case response.code

          when 200
            @response = response

          when 404
            redirect_to root_path, notice: 'Not a valid clan tag, try again'
            return
          end
        }

        @url = RestClient.get 'https://api.clashofclans.com/v1/clans/%23'+ @input, {:Authorization => 'Bearer ' + ENV["clashAPI"], :content_type => :json}

        @tag = JSON.parse(@url)
        @clan = JSON.parse(@response)
    else
      @input = params['clanInput']
      @response = RestClient.get 'https://api.clashofclans.com/v1/clans/%23'+ @input +'/members', {:Authorization => 'Bearer ' + ENV["clashAPI"], :content_type => :json}{ |response, request, result, &block|
        case response.code

        when 200
          @response = response

        when 404
          redirect_to root_path, notice: 'Not a valid clan tag, try again'
          return
        end
      }

      @url = RestClient.get 'https://api.clashofclans.com/v1/clans/%23'+ @input, {:Authorization => 'Bearer ' + ENV["clashAPI"], :content_type => :json}

      @tag = JSON.parse(@url)
      @clan = JSON.parse(@response)
    end



  end

  private
    def set_clan
      @clan = params['clanInput']
    end

    def clan_params
      params.fetch(:clan, {})
    end
end
