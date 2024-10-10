#!/bin/sh

#easy sed
sed -i 's/\[ 💀, 😄 \]/\[ ❄️ , 🌸 \]/' ../rime_ice.schema.yaml
sed -i '33 s/reset: 1/reset: 0/' ../rime_ice.schema.yaml
sed -i '/states: \[ ¥, $ \]/a\    reset: 1' ../rime_ice.schema.yaml
sed -i 's/name: 雾凇拼音/name: 薄荷拼音/' ../rime_ice.schema.yaml

sed -i 's/- schema: double_pinyin/#- schema: double_pinyin/' ../default.yaml
sed -i 's/Caps_Lock: clear/Caps_Lock: noop/' ../default.yaml
sed -i 's/Shift_L: commit_code/Shift_L: noop/' ../default.yaml

sed -i 's/- cn_dicts\/tencent/#- cn_dicts\/tencent/' ../rime_ice.dict.yaml
sed -i "/cn_dicts\/mydict\$/,/\.\.\.\$/{//!d}" ../rime_ice.dict.yaml
sed -i '/# - cn_dicts\/mydict/a\  - cn_dicts\/zhwiki' ../rime_ice.dict.yaml
sed -i '/# - cn_dicts\/mydict/a\  - cn_dicts\/moegirl' ../rime_ice.dict.yaml

sed -i "s/唔姆\twu m/唔姆\twu mu/" ../cn_dicts/moegirl.dict.yaml
sed -i "/but\tbut/d" ../en_dicts/en.dict.yaml
sed -i "/BT\tBT/d" ../en_dicts/en_ext.dict.yaml
#custom_phrase

./dict.sh

sed -i "s/噷\thm\n//" ../custom_phrase.txt
sed -i "s/呣\tm\n//" ../custom_phrase.txt
sed -i "s/呒\tm\n//" ../custom_phrase.txt
#disable pinyin lua

# if ! [ -f "../rime_ice.custom.yaml" ]; then
# 	touch ../rime_ice.custom.yaml
# 	echo "
# # rime_ice.custom.yaml
# patch:
#     translator/spelling_hints: 0" >>../rime_ice.custom.yaml
# fi

#add .gitignore
rm ../.gitignore
touch ../.gitignore
echo "build
luna_pinyin*
rime_ice.userdb
double_pinyin.schema.yaml
double_pinyin_abc.schema.yaml
double_pinyin_flypy.schema.yaml
double_pinyin_mspy.schema.yaml
double_pinyin_sogou.schema.yaml
double_pinyin_ziguang.schema.yaml
tencent.dict.yaml
*abc.txt
*double_pinyin
*flypy.txt
*mspy.txt
*sogou.txt
*ziguang.txt
cn_en_double_pinyin.txt
cn_en_ziguang.txt
sync
" >>../.gitignore

cp ./installation.yaml ../

rm -rf ../en_dicts/cn_en_*
rm -rf ../cn_dicts/tencent.dict.yaml
rm -rf ../double_pinyin*
