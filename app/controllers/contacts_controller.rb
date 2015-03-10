class ContactsController < ApplicationController

  def index
    contacts = Contact.where(user_id: params[:user_id])
    render json: contacts
  end

  def show
    contact = Contact.find(params[:id])
    render json: contact
  end

  def create
    contact = Contact.new(contact_params)
    if contact.save
      render json: contact
    else
      render json: contact.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    contact = Contact.find(params[:id])
    render json: contact
    contact.destroy
  end

  def update
    contact = Contact.find(params[:id])
    if contact.update(contact_params)
      render json: contact
    else
      render json: contact.errors.full_messages, status: :unprocessable_entity
    end
  end

  def favorite
    user = User.find(params[:user_id])
    contact = Contact.find(params[:id])
    if user.contacts.include?(contact)
      contact.favorite = true
      contact.save!
      render json: contact
    elsif user.shared_contacts.include?(contact)
      contact_share = ContactShare.find_by(user_id: user.id, contact_id: contact.id)
      contact_share.favorite = true
      contact_share.save!
      render json: contact_share
    else
      render text: "User doesn't have that contact"
    end
  end

  private
  def contact_params
    params.require(:contact).permit(:email, :name, :user_id)
  end
end
