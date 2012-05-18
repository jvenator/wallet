module AccountHelper
  def activation_text(provider)
    if current_user.integrated_with?(provider)
      "Deactivate"
    else
      "Activate"
    end
  end

  def activation_url(provider)
    provider_name = provider.to_s.chomp('_user')
    if current_user.integrated_with?(provider)
      "/users/auth/destroy?provider=#{provider_name}"

    else
      "/users/auth/#{provider_name}"
    end
  end
end