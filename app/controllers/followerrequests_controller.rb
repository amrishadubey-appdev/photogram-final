class FollowerrequestsController < ApplicationController
  def index
    matching_followerrequests = Followerrequest.all

    @list_of_followerrequests = matching_followerrequests.order({ :created_at => :desc })

    render({ :template => "followerrequests/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_followerrequests = Followerrequest.where({ :id => the_id })

    @the_followerrequest = matching_followerrequests.at(0)

    render({ :template => "followerrequests/show.html.erb" })
  end

  def create
    the_followerrequest = Followerrequest.new
    the_followerrequest.recipient_id = params.fetch("query_recipient_id")
    the_followerrequest.sender_id = params.fetch("query_sender_id")
    the_followerrequest.status = params.fetch("query_status")

    if the_followerrequest.valid?
      the_followerrequest.save
      redirect_to("/followerrequests", { :notice => "Followerrequest created successfully." })
    else
      redirect_to("/followerrequests", { :notice => "Followerrequest failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_followerrequest = Followerrequest.where({ :id => the_id }).at(0)

    the_followerrequest.recipient_id = params.fetch("query_recipient_id")
    the_followerrequest.sender_id = params.fetch("query_sender_id")
    the_followerrequest.status = params.fetch("query_status")

    if the_followerrequest.valid?
      the_followerrequest.save
      redirect_to("/followerrequests/#{the_followerrequest.id}", { :notice => "Followerrequest updated successfully."} )
    else
      redirect_to("/followerrequests/#{the_followerrequest.id}", { :alert => "Followerrequest failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_followerrequest = Followerrequest.where({ :id => the_id }).at(0)

    the_followerrequest.destroy

    redirect_to("/followerrequests", { :notice => "Followerrequest deleted successfully."} )
  end
end
