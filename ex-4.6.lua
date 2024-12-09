-- Exercise 4.6: Redo the previous exercise for UTF-8 strings:
--
-- > remove ("ação", 2, 2) --> ao
--
-- (Here, both the initial position and the length should be counted
-- in codepoints.)

function remove (s, i, n)
   -- Notice how we find the position of the Unicode codepoint _at_
   -- the place where we want to start removing characters, and then
   -- subtract 1 to get the byte before. Had we simply done something
   -- like `utf8.offset(s, i - 1)`, we would've cut off any remaining
   -- bytes from the (i - 1)th Unicode codepoint
   return s:sub (1, utf8.offset (s, i) - 1)
      .. s:sub (utf8.offset (s, i + n), -1)
end

remove ("ação", 2, 2) --> ao

-- Japanese example.
jp = '私は少し日本語が分かります。'
-- print(jp)
print(remove(jp, 3, 2)) --> 私は日本語が分かります。

-- Chinese example.
zh = "我學了中文四年了，可是很長的時間沒有練習。"
-- print(zh)
print(remove(zh, 4, 2)) --> 我學了四年了，可是很長的時間沒有練習。
