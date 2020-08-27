def remove_element(nums,val)
  
  return [] if nums.length == 0
     
     nums.size.times do|ind|
         if nums[ind] == val
             nums[ind] = nil
         end
     end
     nums.compact!
     nums
             
 end

puts remove_element([2,3,2,3,3,4,3,2,2,3,4],2)