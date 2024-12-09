-- Exercise 4.4: Redo the previous exercise for UTF-8 strings:
--
-- > insert ("ação", 5, "!") --> ação!
--
-- (Note that the position now is counted in codepoints.)

function insert (to, i, from)
   return to:sub (1,
                  -- Notice how we find the position of the Unicode
                  -- codepoint _at_ the location we want to insert,
                  -- and then subtract 1, as opposed to just finding
                  -- the position of the preceding codepoint. This is
                  -- because codepoints can span multiple bytes, and
                  -- simply doing `utf8.offset(to, i - 1)` has the
                  -- potential to cut off bytes.
		  utf8.offset (to, i) - 1)
      .. from
      .. to:sub (utf8.offset (to, i),
		 -1)
end

insert ("ação", 5, "!") --> ação!

-- Japanese example.
jp = '私は日本語が分かります。'
-- print(jp)
print(insert(jp, 3, "少し")) --> 私は少し日本語が分かります。

-- Chinese example.
zh = "我學了四年了，可是很長的時間沒有練習。"
-- print(zh)
print(insert(zh, 4, "中文")) --> 我學了中文四年了，可是很長的時間沒有練習
