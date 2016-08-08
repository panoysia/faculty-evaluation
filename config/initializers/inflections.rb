# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format. Inflections
# are locale specific, and you may define rules for as many different
# locales as you wish. All of these examples are active by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
# end

# These inflection rules are supported but not enabled by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.acronym 'RESTful'
# end

ActiveSupport::Inflector.inflections(:en) do |inflect|
  # Most inflections here are for resources under the User module. It uses the singular term for these resources.

  inflect.acronym 'HR'
  inflect.uncountable %w[ dashboard hr_profile account] # career_path
  inflect.irregular 'leave', 'leaves'
  
  inflect.acronym 'QCE'
  inflect.acronym 'QCEs'
  
  inflect.acronym 'CCE'
  inflect.acronym 'CCEs'
  
  inflect.acronym 'NBC'
  inflect.acronym 'NBCs'
end