class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_publication
  before_action :set_comment, only: [ :destroy ]
  before_action :check_admin, only: [ :destroy ]

  # POST /publications/:publication_id/comments
  def create
    @comment = @publication.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @publication, notice: "Comentario agregado exitosamente."
    else
      redirect_to @publication, alert: "No se pudo agregar el comentario."
    end
  end

  # DELETE /comments/:id
  def destroy
    @comment.destroy
    redirect_to @publication, notice: "Comentario eliminado exitosamente."
  end

  private

  def set_publication
    @publication = Publication.find(params[:publication_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

  # Verificar si el usuario es admin
  def check_admin
    unless current_user.admin?
      redirect_to @publication, alert: "No tienes permisos para eliminar este comentario."
    end
  end
end
