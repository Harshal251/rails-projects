class CommensController < ApplicationController



    def create
        @post = Post.find(params[:post_id])
        @comments = @post.comments.create(params[:comment]).permit(:name, :comment))
    end 

    def destroy
    end 

end