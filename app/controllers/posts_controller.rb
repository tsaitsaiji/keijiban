class PostsController < ApplicationController
    def index
        @posts=Post.all #Post是models/Post.rb/中class的名稱
    end

    def new 
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)

        if @post.save
            redirect_to posts_path  #posts是routers.rb中的posts,顯示很多流言的介面,_path可以生成posts的URL
            
        else
            render :new
            
        end
            
    end




    def edit
        @post = Post.find(params[ :id]) #照id尋找要更新哪個訊息
    end

    def update
        @post = Post.find(params[ :id]) #照id尋找要更新哪個訊息
        if @post.update(post_params) #有更新的話
            redirect_to posts_path #回到 posts_path
        else #沒更新的話留在edit介面
            render :edit
        end
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to posts_path #刪掉後回到posts介面
    end
#private要在最下面
    private
    def post_params
       params.require(:post).permit(:title, :content) #更新到資料庫
    end

    def set_post
        @post = Post.find(params[ :id]) #照id尋找要更新哪個訊息
    end
end