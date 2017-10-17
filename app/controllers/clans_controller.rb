class ClansController < ApplicationController

  def index

    if params['clanInput'].nil?
        @input = params['playerInput']
      else
        @input = params['clanInput']
    end

    @response = RestClient.get 'https://api.clashofclans.com/v1/clans/%23'+ @input, {:Authorization => 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiIsImtpZCI6IjI4YTMxOGY3LTAwMDAtYTFlYi03ZmExLTJjNzQzM2M2Y2NhNSJ9.eyJpc3MiOiJzdXBlcmNlbGwiLCJhdWQiOiJzdXBlcmNlbGw6Z2FtZWFwaSIsImp0aSI6IjFhMTYwY2Y1LTBmNDMtNDNkOS1iOWQ2LTgwYWQ5Y2RlYWYxNSIsImlhdCI6MTUwODE5MTkzOSwic3ViIjoiZGV2ZWxvcGVyLzBmODMwMDgxLTAwZDUtYzdkMC1iODVjLTAxMWFmYzcyZmE2MSIsInNjb3BlcyI6WyJjbGFzaCJdLCJsaW1pdHMiOlt7InRpZXIiOiJkZXZlbG9wZXIvc2lsdmVyIiwidHlwZSI6InRocm90dGxpbmcifSx7ImNpZHJzIjpbIjU0LjY5LjU3LjE5MCJdLCJ0eXBlIjoiY2xpZW50In1dfQ.Devza1EMm4hZnZbWQ3RGFwd-wjLrF04vQYzWMr75QkBelOOcVYBRxMklQxlkRp6VBjzNSyAICM0gUV_yBK8x1g', :content_type => :json}

    @clan = JSON.parse(@response)



  end

  private
    def set_clan
      @clan = params['clanInput']
    end

    def clan_params
      params.fetch(:clan, {})
    end
end
