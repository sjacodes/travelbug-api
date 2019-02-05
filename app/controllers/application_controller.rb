# Refactored auth using JWTs only: https://thinkster.io/tutorials/rails-json-api/setting-up-users-and-authentication-for-our-api

class ApplicationController < ActionController::API

    def authenticate_user!
        if request.headers['Authorization'].present?
            begin
                jwt_payload = JWT.decode(request.headers['Authorization'], Rails.application.secrets.jwt_secret).first
            rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError
                render json: { error: 'Unauthorized Access' }, status: 401
            end
        else
            render json: { error: 'No Authentication Header Present' }, status: 401
        end
    end

    def issue_token(payload)
        JWT.encode(payload, Rails.application.secrets.jwt_secret)
    end

    def current_user_id
        if request.headers['Authorization'].present?
            begin
                return JWT.decode(request.headers['Authorization'], Rails.application.secrets.jwt_secret).first['id']
            rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError
                render json: { error: 'Unauthorized Access' }, status: 401
            end
        else
            return nil
        end
    end

end