class ArticlesController < ApplicationController

	# http_basic_authenticate_with name: "foo", password: "bar", except: [:index, :show]

	def index
		fibnum = 35
		logger.info "Calculating Fibonacci of " + fibnum.to_s
		logger.info "Fibonacci: " + fibonacci( fibnum ).to_s
		@articles = Article.all
	end

	def show
		fibnum = 15
		logger.info "Calculating Fibonacci of " + fibnum.to_s
		logger.info "Fibonacci: " + fibonacci( fibnum ).to_s
		@article = Article.find(params[:id])
	end

	def new
		@article = Article.new
	end

	def edit
		@article = Article.find(params[:id])
	end

	def create
		@article = Article.new(article_params)

		if @article.save
			redirect_to articles_path
		else
			render 'new'
		end
	end

	def update
	  @article = Article.find(params[:id])
	 
	  if @article.update(article_params)
	    redirect_to @article
	  else
	    render 'edit'
	  end
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		redirect_to articles_path
	end

	def fibonacci( n )
	  return  n  if ( 0..1 ).include? n
	  ( fibonacci( n - 1 ) + fibonacci( n - 2 ) )
	end


	private
		def article_params
			params.require(:article).permit(:title, :text)
		end
end
