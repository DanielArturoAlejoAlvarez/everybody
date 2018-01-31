module Api
    module V1 
        class PostsController < ApplicationController

            def index
                posts = Post.all.order("created_at DESC")
                render json: {status: 'SUCCESS', msg: 'Loaded Posts', data:posts}, status: :ok
            end

            def show
                post = Post.friendly.find(params[:id])
                render json: {status: 'SUCCESS', msg: 'Loaded post', data:post}, status: :ok
            end

            def create 
                post = Post.new(post_params)
                if post.save
                    render json: {status: 'SUCCESS', msg: 'Saved post', data:post}, status: :ok
                else
                    render json: {status: 'ERROR', msg: 'Post not saved', data:post.errors}, status: :unprocessable_entity
                end
            end

            def update 
                post = Post.friendly.find(params[:id])
                if post.update(post_params)
                    render json: {status: 'SUCCESS', msg: 'Updated post', data:post}, status: :ok
                else 
                    render json: {status: 'ERROR', msg: 'Post not updated', data:post.errors}, status: :unprocessable_entity
                end
            end

            def destroy 
                post = Post.friendly.find(params[:id])
                post.destroy 
                render json: {status: 'SUCCESS', msg: 'Deleted post', data:post}, status: :ok
            end

            private

            def post_params 
                params.require(:post).permit(:title, :body, :slug)
            end
        end
    end
end