# Make sure to run the tests in your /spec folder
# Run `rspec /spec/username_spec.rb` to get started.

class Usernames

	@@usernames = {}

	def self.get_usernames
		@@usernames
	end

	def self.add_username(u, i)
		@@usernames[u] = i
	end
end

def generate_username(first, last, year, i=0)
	usernames_obj = Usernames.get_usernames
	name = build_username(first, last, year, i)
	if(usernames_obj.has_key?(name))
		count = usernames_obj[name]
		new_username = name + "_" + count.to_s
		Usernames.add_username(name, count+1)
		new_username
	else
		Usernames.add_username(name, 1)
		name
	end
end

def format_name(first, last)
	if(first === "" || last === "")
		return nil
	else
		(first.gsub(/\s+|"|'|/, "")[0].downcase + last.gsub(/\s+/, "").downcase).gsub(/[^a-z ]|"|'|'-'/, "")
	end
end

def format_year(year)
	if(year.to_s.length == 4)
		year.to_s[2..3]
	else
		return nil
	end
end

def build_username(first, last, year, i=0)
  user_type_prefix(i) + format_name(first, last) + format_year(year)
end

def check_privilege(i=0)
	user_arr = ["user", "seller", "manager", "admin"]
	if(i<4 && i>=0)
		user_arr[i]
	else
		user_arr[3]
	end
end

def user_type_prefix(i)
	user_arr = ["user", "seller", "manager", "admin"]
	if(i>0)
		user_arr[i]+"-"
	else
		""
	end
end


