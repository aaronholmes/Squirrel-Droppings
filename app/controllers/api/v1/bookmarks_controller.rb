module Api
  module V1
    class BookmarksController < ApplicationController
      respond_to :json
      def index
        respond_with Bookmark.all
      end
      def show
        respond_with Bookmark.find(params[:id])
      end

      def create
        respond_with Bookmark.create(params[:product])
      end

      def update
        respond_with Bookmark.update(params[:id], params[:products])
      end

      def destroy
        respond_with Bookmark.destroy(params[:id])
      end
    end
  end
end

