set lines 200
set pages 100

column key format a30 word_wrapped
column value format A30 word_wrapped
column is_mandatory heading "MAN"
column is_term heading "TERM"
column attr format a40
column file_name format a60
column changes format a50 word_wrapped

column name format a30 word_wrapped

column item_id format A20 word_wrapped
column service_id format 999 word_wrapped
column ptd_id format A15 word_wrapped
column ptd format A15 word_wrapped
column attr_name format A15 word_wrapped
column doc_id format A15 word_wrapped

-- {{{ Global attribute fields
-- {{{ gv 000 - 009
column global_value_000 format a20 word_wrapped heading "global_value_000"
column global_value_001 format a20 word_wrapped heading "global_value_001"
column global_value_002 format a20 word_wrapped heading "global_value_002"
column global_value_003 format a20 word_wrapped heading "global_value_003"
column global_value_004 format a20 word_wrapped heading "global_value_004"
column global_value_005 format a20 word_wrapped heading "global_value_005"
column global_value_006 format a20 word_wrapped heading "global_value_006"
column global_value_007 format a20 word_wrapped heading "global_value_007"
column global_value_008 format a20 word_wrapped heading "global_value_008"
column global_value_009 format a20 word_wrapped heading "global_value_009"
-- }}}
-- {{{ gv 010 - 019
column global_value_010 format a20 word_wrapped heading "global_value_010"
column global_value_011 format a20 word_wrapped heading "global_value_011"
column global_value_012 format a20 word_wrapped heading "global_value_012"
column global_value_013 format a20 word_wrapped heading "global_value_013"
column global_value_014 format a20 word_wrapped heading "global_value_014"
column global_value_015 format a20 word_wrapped heading "global_value_015"
column global_value_016 format a20 word_wrapped heading "global_value_016"
column global_value_017 format a20 word_wrapped heading "global_value_017"
column global_value_018 format a20 word_wrapped heading "global_value_018"
column global_value_019 format a20 word_wrapped heading "global_value_019"
-- }}}
-- {{{ gv 020 - 029
column global_value_020 format a20 word_wrapped heading "global_value_020"
column global_value_021 format a20 word_wrapped heading "global_value_021"
column global_value_022 format a20 word_wrapped heading "global_value_022"
column global_value_023 format a20 word_wrapped heading "global_value_023"
column global_value_024 format a20 word_wrapped heading "global_value_024"
column global_value_025 format a20 word_wrapped heading "global_value_025"
column global_value_026 format a20 word_wrapped heading "global_value_026"
column global_value_027 format a20 word_wrapped heading "global_value_027"
column global_value_028 format a20 word_wrapped heading "global_value_028"
column global_value_029 format a20 word_wrapped heading "global_value_029"
-- }}}
-- {{{ gv 030 - 039
column global_value_030 format a20 word_wrapped heading "global_value_030"
column global_value_031 format a20 word_wrapped heading "global_value_031"
column global_value_032 format a20 word_wrapped heading "global_value_032"
column global_value_033 format a20 word_wrapped heading "global_value_033"
column global_value_034 format a20 word_wrapped heading "global_value_034"
column global_value_035 format a20 word_wrapped heading "global_value_035"
column global_value_036 format a20 word_wrapped heading "global_value_036"
column global_value_037 format a20 word_wrapped heading "global_value_037"
column global_value_038 format a20 word_wrapped heading "global_value_038"
column global_value_039 format a20 word_wrapped heading "global_value_039"
-- }}}
-- {{{ gv 040 - 049
column global_value_040 format a20 word_wrapped heading "global_value_040"
column global_value_041 format a20 word_wrapped heading "global_value_041"
column global_value_042 format a20 word_wrapped heading "global_value_042"
column global_value_043 format a20 word_wrapped heading "global_value_043"
column global_value_044 format a20 word_wrapped heading "global_value_044"
column global_value_045 format a20 word_wrapped heading "global_value_045"
column global_value_046 format a20 word_wrapped heading "global_value_046"
column global_value_047 format a20 word_wrapped heading "global_value_047"
column global_value_048 format a20 word_wrapped heading "global_value_048"
column global_value_049 format a20 word_wrapped heading "global_value_049"
-- }}}
-- }}}
-- {{{ PTD attribute fields
-- {{{ PTD attribute fields 000 - 099
-- {{{ ptd 000 - 009
column ptd_value_000 format a20 word_wrapped heading "ptd_value_000"
column ptd_value_001 format a20 word_wrapped heading "ptd_value_001"
column ptd_value_002 format a20 word_wrapped heading "ptd_value_002"
column ptd_value_003 format a20 word_wrapped heading "ptd_value_003"
column ptd_value_004 format a20 word_wrapped heading "ptd_value_004"
column ptd_value_005 format a20 word_wrapped heading "ptd_value_005"
column ptd_value_006 format a20 word_wrapped heading "ptd_value_006"
column ptd_value_007 format a20 word_wrapped heading "ptd_value_007"
column ptd_value_008 format a20 word_wrapped heading "ptd_value_008"
column ptd_value_009 format a20 word_wrapped heading "ptd_value_009"
-- }}}
-- {{{ ptd 010 - 019
column ptd_value_010 format a20 word_wrapped heading "ptd_value_010"
column ptd_value_011 format a20 word_wrapped heading "ptd_value_011"
column ptd_value_012 format a20 word_wrapped heading "ptd_value_012"
column ptd_value_013 format a20 word_wrapped heading "ptd_value_013"
column ptd_value_014 format a20 word_wrapped heading "ptd_value_014"
column ptd_value_015 format a20 word_wrapped heading "ptd_value_015"
column ptd_value_016 format a20 word_wrapped heading "ptd_value_016"
column ptd_value_017 format a20 word_wrapped heading "ptd_value_017"
column ptd_value_018 format a20 word_wrapped heading "ptd_value_018"
column ptd_value_019 format a20 word_wrapped heading "ptd_value_019"
-- }}}
-- {{{ ptd 020 - 029
column ptd_value_020 format a20 word_wrapped heading "ptd_value_020"
column ptd_value_021 format a20 word_wrapped heading "ptd_value_021"
column ptd_value_022 format a20 word_wrapped heading "ptd_value_022"
column ptd_value_023 format a20 word_wrapped heading "ptd_value_023"
column ptd_value_024 format a20 word_wrapped heading "ptd_value_024"
column ptd_value_025 format a20 word_wrapped heading "ptd_value_025"
column ptd_value_026 format a20 word_wrapped heading "ptd_value_026"
column ptd_value_027 format a20 word_wrapped heading "ptd_value_027"
column ptd_value_028 format a20 word_wrapped heading "ptd_value_028"
column ptd_value_029 format a20 word_wrapped heading "ptd_value_029"
-- }}}
-- {{{ ptd 030 - 039
column ptd_value_030 format a20 word_wrapped heading "ptd_value_030"
column ptd_value_031 format a20 word_wrapped heading "ptd_value_031"
column ptd_value_032 format a20 word_wrapped heading "ptd_value_032"
column ptd_value_033 format a20 word_wrapped heading "ptd_value_033"
column ptd_value_034 format a20 word_wrapped heading "ptd_value_034"
column ptd_value_035 format a20 word_wrapped heading "ptd_value_035"
column ptd_value_036 format a20 word_wrapped heading "ptd_value_036"
column ptd_value_037 format a20 word_wrapped heading "ptd_value_037"
column ptd_value_038 format a20 word_wrapped heading "ptd_value_038"
column ptd_value_039 format a20 word_wrapped heading "ptd_value_039"
-- }}}
-- {{{ ptd 040 - 049
column ptd_value_040 format a20 word_wrapped heading "ptd_value_040"
column ptd_value_041 format a20 word_wrapped heading "ptd_value_041"
column ptd_value_042 format a20 word_wrapped heading "ptd_value_042"
column ptd_value_043 format a20 word_wrapped heading "ptd_value_043"
column ptd_value_044 format a20 word_wrapped heading "ptd_value_044"
column ptd_value_045 format a20 word_wrapped heading "ptd_value_045"
column ptd_value_046 format a20 word_wrapped heading "ptd_value_046"
column ptd_value_047 format a20 word_wrapped heading "ptd_value_047"
column ptd_value_048 format a20 word_wrapped heading "ptd_value_048"
column ptd_value_049 format a20 word_wrapped heading "ptd_value_049"
-- }}}
-- {{{ ptd 050 - 059
column ptd_value_050 format a20 word_wrapped heading "ptd_value_050"
column ptd_value_051 format a20 word_wrapped heading "ptd_value_051"
column ptd_value_052 format a20 word_wrapped heading "ptd_value_052"
column ptd_value_053 format a20 word_wrapped heading "ptd_value_053"
column ptd_value_054 format a20 word_wrapped heading "ptd_value_054"
column ptd_value_055 format a20 word_wrapped heading "ptd_value_055"
column ptd_value_056 format a20 word_wrapped heading "ptd_value_056"
column ptd_value_057 format a20 word_wrapped heading "ptd_value_057"
column ptd_value_058 format a20 word_wrapped heading "ptd_value_058"
column ptd_value_059 format a20 word_wrapped heading "ptd_value_059"
-- }}}
-- {{{ ptd 060 - 069
column ptd_value_060 format a20 word_wrapped heading "ptd_value_060"
column ptd_value_061 format a20 word_wrapped heading "ptd_value_061"
column ptd_value_062 format a20 word_wrapped heading "ptd_value_062"
column ptd_value_063 format a20 word_wrapped heading "ptd_value_063"
column ptd_value_064 format a20 word_wrapped heading "ptd_value_064"
column ptd_value_065 format a20 word_wrapped heading "ptd_value_065"
column ptd_value_066 format a20 word_wrapped heading "ptd_value_066"
column ptd_value_067 format a20 word_wrapped heading "ptd_value_067"
column ptd_value_068 format a20 word_wrapped heading "ptd_value_068"
column ptd_value_069 format a20 word_wrapped heading "ptd_value_069"
-- }}}
-- {{{ ptd 070 - 079
column ptd_value_070 format a20 word_wrapped heading "ptd_value_070"
column ptd_value_071 format a20 word_wrapped heading "ptd_value_071"
column ptd_value_072 format a20 word_wrapped heading "ptd_value_072"
column ptd_value_073 format a20 word_wrapped heading "ptd_value_073"
column ptd_value_074 format a20 word_wrapped heading "ptd_value_074"
column ptd_value_075 format a20 word_wrapped heading "ptd_value_075"
column ptd_value_076 format a20 word_wrapped heading "ptd_value_076"
column ptd_value_077 format a20 word_wrapped heading "ptd_value_077"
column ptd_value_078 format a20 word_wrapped heading "ptd_value_078"
column ptd_value_079 format a20 word_wrapped heading "ptd_value_079"
-- }}}
-- {{{ ptd 080 - 089
column ptd_value_080 format a20 word_wrapped heading "ptd_value_080"
column ptd_value_081 format a20 word_wrapped heading "ptd_value_081"
column ptd_value_082 format a20 word_wrapped heading "ptd_value_082"
column ptd_value_083 format a20 word_wrapped heading "ptd_value_083"
column ptd_value_084 format a20 word_wrapped heading "ptd_value_084"
column ptd_value_085 format a20 word_wrapped heading "ptd_value_085"
column ptd_value_086 format a20 word_wrapped heading "ptd_value_086"
column ptd_value_087 format a20 word_wrapped heading "ptd_value_087"
column ptd_value_088 format a20 word_wrapped heading "ptd_value_088"
column ptd_value_089 format a20 word_wrapped heading "ptd_value_089"
-- }}}
-- {{{ ptd 090 - 099
column ptd_value_090 format a20 word_wrapped heading "ptd_value_090"
column ptd_value_091 format a20 word_wrapped heading "ptd_value_091"
column ptd_value_092 format a20 word_wrapped heading "ptd_value_092"
column ptd_value_093 format a20 word_wrapped heading "ptd_value_093"
column ptd_value_094 format a20 word_wrapped heading "ptd_value_094"
column ptd_value_095 format a20 word_wrapped heading "ptd_value_095"
column ptd_value_096 format a20 word_wrapped heading "ptd_value_096"
column ptd_value_097 format a20 word_wrapped heading "ptd_value_097"
column ptd_value_098 format a20 word_wrapped heading "ptd_value_098"
column ptd_value_099 format a20 word_wrapped heading "ptd_value_099"
-- }}}
-- }}}
-- {{{ PTD attribute fields 100 - 199
-- {{{ ptd 100 - 109
column ptd_value_100 format a20 word_wrapped heading "ptd_value_100"
column ptd_value_101 format a20 word_wrapped heading "ptd_value_101"
column ptd_value_102 format a20 word_wrapped heading "ptd_value_102"
column ptd_value_103 format a20 word_wrapped heading "ptd_value_103"
column ptd_value_104 format a20 word_wrapped heading "ptd_value_104"
column ptd_value_105 format a20 word_wrapped heading "ptd_value_105"
column ptd_value_106 format a20 word_wrapped heading "ptd_value_106"
column ptd_value_107 format a20 word_wrapped heading "ptd_value_107"
column ptd_value_108 format a20 word_wrapped heading "ptd_value_108"
column ptd_value_109 format a20 word_wrapped heading "ptd_value_109"
-- }}}
-- {{{ ptd 110 - 119
column ptd_value_110 format a20 word_wrapped heading "ptd_value_110"
column ptd_value_111 format a20 word_wrapped heading "ptd_value_111"
column ptd_value_112 format a20 word_wrapped heading "ptd_value_112"
column ptd_value_113 format a20 word_wrapped heading "ptd_value_113"
column ptd_value_114 format a20 word_wrapped heading "ptd_value_114"
column ptd_value_115 format a20 word_wrapped heading "ptd_value_115"
column ptd_value_116 format a20 word_wrapped heading "ptd_value_116"
column ptd_value_117 format a20 word_wrapped heading "ptd_value_117"
column ptd_value_118 format a20 word_wrapped heading "ptd_value_118"
column ptd_value_119 format a20 word_wrapped heading "ptd_value_119"
-- }}}
-- {{{ ptd 120 - 129
column ptd_value_120 format a20 word_wrapped heading "ptd_value_120"
column ptd_value_121 format a20 word_wrapped heading "ptd_value_121"
column ptd_value_122 format a20 word_wrapped heading "ptd_value_122"
column ptd_value_123 format a20 word_wrapped heading "ptd_value_123"
column ptd_value_124 format a20 word_wrapped heading "ptd_value_124"
column ptd_value_125 format a20 word_wrapped heading "ptd_value_125"
column ptd_value_126 format a20 word_wrapped heading "ptd_value_126"
column ptd_value_127 format a20 word_wrapped heading "ptd_value_127"
column ptd_value_128 format a20 word_wrapped heading "ptd_value_128"
column ptd_value_129 format a20 word_wrapped heading "ptd_value_129"
-- }}}
-- {{{ ptd 130 - 139
column ptd_value_130 format a20 word_wrapped heading "ptd_value_130"
column ptd_value_131 format a20 word_wrapped heading "ptd_value_131"
column ptd_value_132 format a20 word_wrapped heading "ptd_value_132"
column ptd_value_133 format a20 word_wrapped heading "ptd_value_133"
column ptd_value_134 format a20 word_wrapped heading "ptd_value_134"
column ptd_value_135 format a20 word_wrapped heading "ptd_value_135"
column ptd_value_136 format a20 word_wrapped heading "ptd_value_136"
column ptd_value_137 format a20 word_wrapped heading "ptd_value_137"
column ptd_value_138 format a20 word_wrapped heading "ptd_value_138"
column ptd_value_139 format a20 word_wrapped heading "ptd_value_139"
-- }}}
-- {{{ ptd 140 - 149
column ptd_value_140 format a20 word_wrapped heading "ptd_value_140"
column ptd_value_141 format a20 word_wrapped heading "ptd_value_141"
column ptd_value_142 format a20 word_wrapped heading "ptd_value_142"
column ptd_value_143 format a20 word_wrapped heading "ptd_value_143"
column ptd_value_144 format a20 word_wrapped heading "ptd_value_144"
column ptd_value_145 format a20 word_wrapped heading "ptd_value_145"
column ptd_value_146 format a20 word_wrapped heading "ptd_value_146"
column ptd_value_147 format a20 word_wrapped heading "ptd_value_147"
column ptd_value_148 format a20 word_wrapped heading "ptd_value_148"
column ptd_value_149 format a20 word_wrapped heading "ptd_value_149"
-- }}}
-- {{{ ptd 150 - 159
column ptd_value_150 format a20 word_wrapped heading "ptd_value_150"
column ptd_value_151 format a20 word_wrapped heading "ptd_value_151"
column ptd_value_152 format a20 word_wrapped heading "ptd_value_152"
column ptd_value_153 format a20 word_wrapped heading "ptd_value_153"
column ptd_value_154 format a20 word_wrapped heading "ptd_value_154"
column ptd_value_155 format a20 word_wrapped heading "ptd_value_155"
column ptd_value_156 format a20 word_wrapped heading "ptd_value_156"
column ptd_value_157 format a20 word_wrapped heading "ptd_value_157"
column ptd_value_158 format a20 word_wrapped heading "ptd_value_158"
column ptd_value_159 format a20 word_wrapped heading "ptd_value_159"
-- }}}
-- {{{ ptd 160 - 169
column ptd_value_160 format a20 word_wrapped heading "ptd_value_160"
column ptd_value_161 format a20 word_wrapped heading "ptd_value_161"
column ptd_value_162 format a20 word_wrapped heading "ptd_value_162"
column ptd_value_163 format a20 word_wrapped heading "ptd_value_163"
column ptd_value_164 format a20 word_wrapped heading "ptd_value_164"
column ptd_value_165 format a20 word_wrapped heading "ptd_value_165"
column ptd_value_166 format a20 word_wrapped heading "ptd_value_166"
column ptd_value_167 format a20 word_wrapped heading "ptd_value_167"
column ptd_value_168 format a20 word_wrapped heading "ptd_value_168"
column ptd_value_169 format a20 word_wrapped heading "ptd_value_169"
-- }}}
-- {{{ ptd 170 - 179
column ptd_value_170 format a20 word_wrapped heading "ptd_value_170"
column ptd_value_171 format a20 word_wrapped heading "ptd_value_171"
column ptd_value_172 format a20 word_wrapped heading "ptd_value_172"
column ptd_value_173 format a20 word_wrapped heading "ptd_value_173"
column ptd_value_174 format a20 word_wrapped heading "ptd_value_174"
column ptd_value_175 format a20 word_wrapped heading "ptd_value_175"
column ptd_value_176 format a20 word_wrapped heading "ptd_value_176"
column ptd_value_177 format a20 word_wrapped heading "ptd_value_177"
column ptd_value_178 format a20 word_wrapped heading "ptd_value_178"
column ptd_value_179 format a20 word_wrapped heading "ptd_value_179"
-- }}}
-- {{{ ptd 180 - 189
column ptd_value_180 format a20 word_wrapped heading "ptd_value_180"
column ptd_value_181 format a20 word_wrapped heading "ptd_value_181"
column ptd_value_182 format a20 word_wrapped heading "ptd_value_182"
column ptd_value_183 format a20 word_wrapped heading "ptd_value_183"
column ptd_value_184 format a20 word_wrapped heading "ptd_value_184"
column ptd_value_185 format a20 word_wrapped heading "ptd_value_185"
column ptd_value_186 format a20 word_wrapped heading "ptd_value_186"
column ptd_value_187 format a20 word_wrapped heading "ptd_value_187"
column ptd_value_188 format a20 word_wrapped heading "ptd_value_188"
column ptd_value_189 format a20 word_wrapped heading "ptd_value_189"
-- }}}
-- {{{ ptd 190 - 199
column ptd_value_190 format a20 word_wrapped heading "ptd_value_190"
column ptd_value_191 format a20 word_wrapped heading "ptd_value_191"
column ptd_value_192 format a20 word_wrapped heading "ptd_value_192"
column ptd_value_193 format a20 word_wrapped heading "ptd_value_193"
column ptd_value_194 format a20 word_wrapped heading "ptd_value_194"
column ptd_value_195 format a20 word_wrapped heading "ptd_value_195"
column ptd_value_196 format a20 word_wrapped heading "ptd_value_196"
column ptd_value_197 format a20 word_wrapped heading "ptd_value_197"
column ptd_value_198 format a20 word_wrapped heading "ptd_value_198"
column ptd_value_199 format a20 word_wrapped heading "ptd_value_199"
-- }}}
-- }}}
-- {{{ PTD attribute fields 200 - 209
-- {{{ ptd 200 - 209
column ptd_value_200 format a20 word_wrapped heading "ptd_value_200"
column ptd_value_201 format a20 word_wrapped heading "ptd_value_201"
column ptd_value_202 format a20 word_wrapped heading "ptd_value_202"
column ptd_value_203 format a20 word_wrapped heading "ptd_value_203"
column ptd_value_204 format a20 word_wrapped heading "ptd_value_204"
column ptd_value_205 format a20 word_wrapped heading "ptd_value_205"
column ptd_value_206 format a20 word_wrapped heading "ptd_value_206"
column ptd_value_207 format a20 word_wrapped heading "ptd_value_207"
column ptd_value_208 format a20 word_wrapped heading "ptd_value_208"
column ptd_value_209 format a20 word_wrapped heading "ptd_value_209"
-- }}}
-- }}}
-- }}}

column property_name format a30
column property_value format a30
column description format a50 word_wrapped
