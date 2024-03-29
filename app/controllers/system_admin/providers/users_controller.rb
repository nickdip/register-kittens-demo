# frozen_string_literal: true

module SystemAdmin
  module Providers
    class UsersController < ApplicationController
      def index
        @users = policy_scope(User, policy_scope_class: UserPolicy)
          .order_by_last_name
          .page(params[:page] || 1)
      end

      def edit
        user
        provider
      end

      def update
        if user.update(permitted_attributes(user))
          redirect_to(provider_path(provider), flash: { success: t(".success") })
        else
          user
          provider
          render(:edit)
        end
      end

    private

      def provider
        @provider ||= Provider.find(params[:provider_id])
      end

      def user
        @user ||= authorize(User.find(params[:id]))
      end
    end
  end
end
