%%
%% This is file `ctexbeamer.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% ctex.dtx  (with options: `class,beamer')
%% 
%%     Copyright (C) 2003--2020
%%     CTEX.ORG and any individual authors listed in the documentation.
%% ---------------------------------------------------------------------
%% 
%%     This work may be distributed and/or modified under the
%%     conditions of the LaTeX Project Public License, either
%%     version 1.3c of this license or (at your option) any later
%%     version. This version of this license is in
%%        http://www.latex-project.org/lppl/lppl-1-3c.txt
%%     and the latest version of this license is in
%%        http://www.latex-project.org/lppl.txt
%%     and version 1.3 or later is part of all distributions of
%%     LaTeX version 2005/12/01 or later.
%% 
%%     This work has the LPPL maintenance status "maintained".
%% 
%% ---------------------------------------------------------------------
%% 
\NeedsTeXFormat{LaTeX2e}
\input{ctexbackend.cfg}
\RequirePackage{expl3}
\GetIdInfo$Id: ctex.dtx 320df30 2020-05-02 06:45:05 +0800 Qing Lee <sobenlee@gmail.com> $
  {Chinese adapter for class beamer (CTEX)}
\ProvidesExplClass{ctexbeamer}
  {\ExplFileDate}{2.5.1}{\ExplFileDescription}
\tl_const:Nx \c__ctex_version_tl
  { \cs_if_exist_use:cF { ver@ \@currname . \@currext } { 9999/99/99 } }
\cs_new_eq:cN { ver@ctex.        \@pkgextension } \c__ctex_version_tl
\cs_new_eq:cN { ver@ctexcap.     \@pkgextension } \c__ctex_version_tl
\cs_new_eq:cN { ver@ctexsize.    \@pkgextension } \c__ctex_version_tl
\cs_new_eq:cN { ver@ctexheading. \@pkgextension } \c__ctex_version_tl
\RequirePackage { xparse , l3keys2e }
\msg_new:nnnn { ctex } { l3-too-old }
  { Support~package~`#1'~too~old. }
  {
    Please~update~an~up-to-date~version~of~the~bundles\\\\
    `l3kernel'~and~`l3packages'\\\\
    using~your~TeX~package~manager~or~from~CTAN.
  }
\@ifpackagelater { expl3 } { 2020/04/06 } { }
  { \msg_error:nnn { ctex } { l3-too-old } { expl3 } }
\@ifpackagelater { l3keys2e } { 2015/12/20 } { }
  { \msg_error:nnn { ctex } { l3-too-old } { l3keys2e } }
\str_const:Nx \c__ctex_engine_str
  { \cs_if_exist:NTF \ngostype { aptex } { \c_sys_engine_str } }
\msg_new:nnnn { ctex } { engine-not-supported }
  { Engine~`#1'~is~not~yet~supported,~ctex~will~abort! }
  { You~can~switch~to~xelatex,~lualatex,~pdflatex,~uplatex,~or~aplatex. }
\file_if_exist:nTF { ctex-engine- \c__ctex_engine_str .def }
  {
    \str_const:Nx \c__ctex_engine_file_str
      { ctex-engine- \c__ctex_engine_str .def }
  }
  { \msg_critical:nnx { ctex } { engine-not-supported } { \c__ctex_engine_str } }
\RequirePackage { ctexhook , ctexpatch }
\RequirePackage { fix-cm }
\RequirePackage { everysel }
\tl_clear_new:N \l__ctex_tmp_tl
\int_new:N \l__ctex_tmp_int
\box_new:N \l__ctex_tmp_box
\dim_new:N \l__ctex_tmp_dim
\cs_new_protected:Npn \ctex_define_option:n
  { \keys_define:nn { ctex / option } }
\cs_new_protected:Npn \ctex_define:n
  { \keys_define:nn { ctex } }
\cs_new_protected:Npn \ctex_set:n
  { \keys_set:nn { ctex } }
\cs_new_protected:Npn \ctex_set:nn #1
  { \keys_set:nn { ctex / #1 } }
\cs_new_protected:Npn \ctex_file_wrapper:nnn #1#2#3
  {
    \use:x
      {
        \ExplSyntaxOff
        \char_set_catcode_letter:n { 64 }
        #1
        \exp_not:n {#2}
        \bool_if:NTF \l__kernel_expl_bool
          { \ExplSyntaxOn }
          { \ExplSyntaxOff }
        \char_set_catcode:nn { 64 } { \char_value_catcode:n { 64 } }
        #3
      }
  }
\cs_new_protected:Npn \ctex_file_input:n #1
  { \ctex_file_wrapper:nnn { } { \file_input:n {#1} } { } }
\cs_new_protected:Npn \ctex_scheme_input:n #1
  {
    \ctex_file_wrapper:nnn
      { }
      {
        \tl_if_exist:NTF \c__ctex_class_tl
          {
            \file_if_exist_input:nF { ctex-scheme- #1 - \c__ctex_class_tl .def }
              { \file_input:n  { ctex-scheme- #1 .def } }
          }
          { \file_input:n  { ctex-scheme- #1 .def } }
      }
      { }
  }
\cs_generate_variant:Nn \ctex_scheme_input:n { o }
\msg_new:nnnn { ctex } { package-too-old }
  { Support~package~`#1'~too~old. }
  {
    Please~update~an~up-to-date~version~of~the~package~`#1'\\
    using~your~TeX~package~manager~or~from~CTAN.
  }
\sys_if_output_pdf:TF
  { \cs_new_eq:NN \ifctexpdf \if_true: }
  { \cs_new_eq:NN \ifctexpdf \if_false: }
\cs_new_eq:NN \ctex_if_preamble:TF \use_i:nn
\ctex_after_end_preamble:n { \cs_set_eq:NN \ctex_if_preamble:TF \use_ii:nn }
\cs_new_protected:Npn \ctex_set_default_ccwd:Nn #1#2
  { \tl_set:Nx #1 { \__ctex_default_ccwd_aux:n {#2} } }
\cs_new:Npn \__ctex_default_ccwd_aux:n #1
  {
    \exp_not:n {#1}
    \exp_after:wN \__ctex_default_ccwd_aux:w
      \dim_use:N \tex_dimexpr:D #1 pt \scan_stop: \q_stop
  }
\exp_last_unbraced:NNNNo
  \cs_new:Npn \__ctex_default_ccwd_aux:w #1 { \tl_to_str:n { pt } } #2 \q_stop
    { \tl_if_empty:nT {#2} { \ccwd } }
\tl_new:N \g__ctex_encoding_tl
\bool_new:N \g__ctex_zhmCJK_bool
\tl_new:N \l__ctex_autoindent_tl
\cs_new_eq:NN \ctex_if_autoindent_touched:F \use:n
\cs_new_eq:NN \ctex_zhmap_case:nnn \use_ii:nnn
\cs_new_protected:Npn \ctex_at_end:n { \AtEndOfClass }
\clist_new:N \g__ctex_std_options_clist
\msg_new:nnn { ctex } { invalid-option }
  { Option~`\l_keys_key_tl'~is~invalid~in~current~mode. }
\msg_new:nnn { ctex } { invalid-value }
  { Value~`#1'~is~invalid~for~the~key~`\l_keys_key_tl'. }
\cs_new_protected:Npn \ctex_deprecated_option:n
  { \msg_warning:nnn { ctex } { deprecated-option } }
\cs_new_protected:Npn \ctex_set_deprecated_option:n #1
  {
    \ctex_deprecated_option:n { Option~`#1'~is~set. }
    \ctex_set:nn { option } {#1}
  }
\cs_new_protected:Npn \ctex_deprecated_command:Nn #1#2
  {
    \msg_warning:nnxx { ctex } { deprecated-command }
      { \token_to_str:N #1 } { \exp_not:n {#2} }
  }
\msg_new:nnn { ctex } { deprecated-option }
  { Option~`\l_keys_key_tl'~is~deprecated.\\ #1 }
\msg_new:nnn { ctex } { deprecated-command }
  { Command~`#1'~is~deprecated.\\ #2 }
\int_new:N \g__ctex_font_size_int
\int_gset:Nn \g__ctex_font_size_int { -1 }
\ctex_define_option:n
  {
    zihao .choice: ,
    zihao .value_required:n = true ,
    zihao /     5  .code:n = { \int_gset:Nn \g__ctex_font_size_int { 0 } } ,
    zihao /    -4  .code:n = { \int_gset:Nn \g__ctex_font_size_int { 1 } } ,
    zihao / false  .code:n = { \int_gset:Nn \g__ctex_font_size_int { 2 } } ,
    c5size  .code:n = { \ctex_set_deprecated_option:n { zihao =  5 } } ,
    cs4size .code:n = { \ctex_set_deprecated_option:n { zihao = -4 } } ,
    c5size  .value_forbidden:n = true ,
    cs4size .value_forbidden:n = true ,
    linespread  .fp_set:N = \l__ctex_line_spread_fp ,
    linespread .initial:n = { \c_nan_fp } ,
    linespread .value_required:n = true ,
    autoindent .choice: ,
    autoindent .default:n = { true } ,
    autoindent / true    .code:n =
      {
        \tl_set:Nn \l__ctex_autoindent_tl { 2 \ccwd }
        \cs_set_eq:NN \ctex_if_autoindent_touched:F \use_none:n
      } ,
    autoindent / false   .code:n =
      {
        \tl_clear:N \l__ctex_autoindent_tl
        \cs_set_eq:NN \ctex_if_autoindent_touched:F \use_none:n
      } ,
    autoindent / unknown .code:n =
      {
        \ctex_set_default_ccwd:Nn \l__ctex_autoindent_tl {#1}
        \cs_set_eq:NN \ctex_if_autoindent_touched:F \use_none:n
      } ,
    indent .code:n =
      {
        \ctex_deprecated_option:n
          {
            The~functionality~has~been~removed.\\
            It's~better~to~set~the~heading~styles~via~`afterindent'~option.
          }
      } ,
    indent .value_forbidden:n = true ,
    noindent .code:n =
      {
        \ctex_deprecated_option:n
          {
            The~functionality~has~been~removed.\\
            It's~better~to~set~the~heading~styles~via~`afterindent'~option.
          }
      } ,
    noindent .value_forbidden:n = true ,
    GBK  .code:n =
      {
        \sys_if_engine_pdftex:TF
          { \tl_gset:Nn \g__ctex_encoding_tl { GBK } }
          {
            \msg_warning:nn { ctex } { invalid-option }
            \tl_gset:Nn \g__ctex_encoding_tl { UTF8 }
          }
      } ,
    UTF8 .code:n = { \tl_gset:Nn \g__ctex_encoding_tl { UTF8 } } ,
    GBK  .value_forbidden:n = true ,
    UTF8 .value_forbidden:n = true ,
    fontset    .tl_gset:N = \g__ctex_fontset_tl ,
    nofonts    .code:n = { \ctex_set_deprecated_option:n { fontset = none } } ,
    adobefonts .code:n = { \ctex_set_deprecated_option:n { fontset = adobe } } ,
    winfonts   .code:n = { \ctex_set_deprecated_option:n { fontset = windows } } ,
    nofonts    .value_forbidden:n = true ,
    winfonts   .value_forbidden:n = true ,
    adobefonts .value_forbidden:n = true ,
    zhmap .choice: ,
    zhmap .default:n = { true } ,
    zhmap / zhmCJK .code:n =
      {
        \bool_gset_true:N \g__ctex_zhmCJK_bool
        \cs_gset_eq:NN \ctex_zhmap_case:nnn \use_i:nnn
      } ,
    zhmap / true   .code:n =
      {
        \bool_gset_false:N \g__ctex_zhmCJK_bool
        \cs_gset_eq:NN \ctex_zhmap_case:nnn \use_ii:nnn
      } ,
    zhmap / false  .code:n =
      {
        \bool_gset_false:N \g__ctex_zhmCJK_bool
        \cs_gset_eq:NN \ctex_zhmap_case:nnn \use_iii:nnn
      } ,
    nozhmap   .code:n =
      { \ctex_set_deprecated_option:n { zhmap = false } } ,
    nozhmap   .value_forbidden:n = true ,
    punct   .tl_set:N = \l__ctex_punct_tl ,
    punct  .default:n = { quanjiao } ,
    punct  .initial:n = { quanjiao } ,
    nopunct   .code:n = \ctex_set_deprecated_option:n { punct = plain } ,
    nopunct   .value_forbidden:n = true ,
    space .choices:nn =
      { true , auto , false }
      {
        \exp_args:Nx \ctex_at_end:n
          { \ctex_set:n { space = \l_keys_choice_tl } }
      } ,
    space  .default:n = { true } ,
    nospace   .code:n = { \ctex_deprecated_option:nn { space = false } } ,
    nospace   .value_forbidden:n = true ,
    heading .bool_set:N = \l__ctex_heading_bool ,
    scheme .tl_set:N  = \l__ctex_scheme_tl ,
    scheme .default:n = { chinese } ,
    scheme .initial:n = { chinese } ,
    cap    .code:n = { \ctex_set_deprecated_option:n { scheme = chinese } } ,
    nocap  .code:n = { \ctex_set_deprecated_option:n { scheme = plain } } ,
    cap    .value_forbidden:n = true ,
    nocap  .value_forbidden:n = true ,
    fntef .code:n =
      {
        \sys_if_engine_xetex:TF
          {
            \ctex_deprecated_option:n { `xeCJKfntef'~package~is~loaded. }
            \ctex_at_end:n { \RequirePackage { xeCJKfntef } }
          }
          {
            \sys_if_engine_pdftex:TF
              {
                \ctex_deprecated_option:n { `CJKfntef'~package~is~loaded. }
                \ctex_at_end:n { \RequirePackage { CJKfntef } }
              }
              {
                \ctex_deprecated_option:n
                  { Furthermore,~option~`fntef'~is~invalid~in~current~mode. }
              }
          }
      } ,
    fancyhdr .code:n =
      {
        \ctex_deprecated_option:n { `fancyhdr'~package~is~loaded. }
        \ctex_at_end:n { \RequirePackage { fancyhdr } }
      } ,
    hyperref .code:n =
      {
        \ctex_deprecated_option:n { `hyperref'~package~will~be~loaded. }
        \ctex_at_end:n
          {
            \cs_if_exist:NF \hypersetup
              { \cs_new_eq:NN \hypersetup \ctex_hypersetup:n }
          }
        \ctex_at_end_preamble:n { \RequirePackage { hyperref } }
      } ,
  }
\tl_clear_new:N \l__ctex_tmp_tl
\clist_map_inline:nn
  {
    10pt , 11pt , 12pt ,
     8pt ,  9pt , 14pt , 17pt , 20pt , 25pt , 30pt , 36pt , 48pt , 60pt
  }
  {
    \tl_put_right:Nn \l__ctex_tmp_tl
      {
        #1 .code:n =
          {
            \int_gset:Nn \g__ctex_font_size_int { 2 }
            \clist_gput_right:Nn \g__ctex_std_options_clist {#1}
          } ,
        #1 .value_forbidden:n = true ,
      }
  }
\exp_args:No \ctex_define_option:n { \l__ctex_tmp_tl }
\tl_clear:N \l__ctex_tmp_tl
\ctex_define_option:n
  {
    unknown .code:n =
      { \clist_gput_right:No \g__ctex_std_options_clist { \CurrentOption } }
  }
\ctex_file_input:n { ctexopts.cfg }
\ProcessKeysOptions { ctex / option }
\msg_new:nnn { ctex } { pdftex-utf8 }
  { UTF8~will~be~used~as~the~default~encoding. }
\tl_if_empty:NT \g__ctex_encoding_tl
  {
    \sys_if_engine_pdftex:T
      { \msg_warning:nn { ctex } { pdftex-utf8 } }
    \tl_gset:Nn \g__ctex_encoding_tl { UTF8 }
  }
\int_case:nn { \g__ctex_font_size_int }
  {
    { 0 } { \clist_gput_right:Nn \g__ctex_std_options_clist { 10pt } }
    { 1 } { \clist_gput_right:Nn \g__ctex_std_options_clist { 12pt } }
  }
\tl_const:Nn \c__ctex_class_tl { beamer }
\PassOptionsToClass { \g__ctex_std_options_clist } { beamer }
\LoadClass { beamer }
\@ifpackageloaded { hyperref }
  {
    \cs_new_protected:Npn \ctex_hypersetup:n #1
      { \hypersetup {#1} }
  }
  {
    \cs_new_protected:Npn \ctex_hypersetup:n #1
      { \PassOptionsToPackage {#1} { hyperref } }
  }
\ctex_file_input:n { \c__ctex_engine_file_str }
\NewDocumentCommand \ctexset { } { \ctex_set:n }
\NewDocumentCommand \CTEXsetup { +O { } > { \TrimSpaces } m }
  {
    \tl_if_blank:nTF {#1}
      { \ctex_deprecated_command:Nn \CTEXsetup { } }
      {
        \ctex_deprecated_command:Nn \CTEXsetup
          { \ctexset {~#2~=~{~#1~}~}~is~set. }
        \ctex_set:nn {#2} {#1}
      }
  }
\NewDocumentCommand \CTEXoptions { +O { } }
  {
    \tl_if_blank:nTF {#1}
      { \ctex_deprecated_command:Nn \CTEXoptions { } }
      {
        \ctex_deprecated_command:Nn \CTEXoptions
          { \ctexset {~#1~}~is~set. }
        \ctex_set:n {#1}
      }
  }
\ctex_define:n
  {
    autoindent .choice: ,
    autoindent .default:n = { true } ,
    autoindent / true    .code:n =
      {
        \tl_set:Nn \l__ctex_autoindent_tl { 2 \ccwd }
        \ctex_select_size:
      } ,
    autoindent / false   .code:n =
      { \tl_clear:N \l__ctex_autoindent_tl } ,
    autoindent / unknown .code:n =
      {
        \ctex_set_default_ccwd:Nn \l__ctex_autoindent_tl {#1}
        \ctex_select_size:
      }
  }
\NewDocumentCommand \CTEXsetfont { } { \ctex_select_size: }
\cs_new_protected:Npn \ctex_select_size:
  { \cs_if_free:NTF \size@update { \ctex_update_size: } { \selectfont } }
\cs_new_protected:Npn \ctex_update_size:
  {
    \tl_if_eq:NNTF \l__ctex_ziju_tl \c__ctex_zero_tl
      {
        \ctex_update_stretch:
        \ctex_update_parindent:
      }
      { \ctex_update_ziju: }
  }
\tl_const:Nx \c__ctex_zero_tl { \fp_use:N \c_zero_fp }
\tl_new:N \l__ctex_ziju_tl
\tl_set_eq:NN \l__ctex_ziju_tl \c__ctex_zero_tl
\ctex_add_to_selectfont:n
  { \cs_if_free:NF \size@update { \ctex_update_size: } }
\ctex_define:n
  {
    linestretch .code:n =
      {
        \ctex_set_default_ccwd:Nn \l__ctex_line_stretch_tl {#1}
        \ctex_select_size:
      } ,
    linestretch .value_required:n = true
  }
\tl_new:N \l__ctex_line_stretch_tl
\tl_set:Nn \l__ctex_line_stretch_tl { \ccwd }
\cs_new_protected:Npn \ctex_update_stretch:
  {
    \ctex_update_em_unit:
    \dim_set:Nn \l__ctex_tmp_dim { \l__ctex_line_stretch_tl }
    \dim_compare:nNnTF \l__ctex_tmp_dim = \c_max_dim
      {
        \ctex_if_ccglue_touched:TF
          { \ctex_update_ccwd: }
          {
            \dim_set:Nn \l__ctex_tmp_dim
              { \baselinestretch \tex_glueexpr:D \f@baselineskip \scan_stop: }
            \skip_set:Nn \l__ctex_ccglue_skip
              { \c_zero_dim plus .08 \l__ctex_tmp_dim }
            \ctex_update_ccglue:
          }
      }
      {
        \int_set:Nn \l__ctex_tmp_int
          { \tex_dimexpr:D \linewidth - \ccwd - \l__ctex_tmp_dim \scan_stop: }
        \tex_divide:D \l__ctex_tmp_int \ccwd
        \int_compare:nNnTF \l__ctex_tmp_int > \c_zero_int
          {
            \skip_set:Nn \l__ctex_ccglue_skip
              {
                \c_zero_dim plus \dim_eval:n
                  {
                    ( \linewidth - \ccwd - \l__ctex_tmp_int \ccwd ) /
                    \l__ctex_tmp_int
                  }
              }
          }
          { \skip_zero:N \l__ctex_ccglue_skip }
        \ctex_update_ccglue:
      }
  }
\cs_new_protected:Npn \ctex_update_parindent:
  {
    \tl_if_empty:NF \l__ctex_autoindent_tl
      {
        \dim_compare:nNnF \parindent = \c_zero_dim
          { \dim_set:Nn \parindent { \l__ctex_autoindent_tl } }
      }
  }
\NewDocumentCommand \ziju { m }
  { \exp_args:Nx \ctex_ziju:n {#1} \tex_ignorespaces:D }
\cs_new_protected:Npn \ctex_ziju:n #1
  {
    \tl_set:Nx \l__ctex_ziju_tl { \fp_eval:n {#1} }
    \ctex_select_size:
  }
\cs_new_protected:Npn \ctex_update_ziju:
  {
    \ctex_update_em_unit:
    \dim_set:Nn \l__ctex_ziju_dim { \l__ctex_ziju_tl \ccwd }
    \dim_add:Nn \ccwd { \l__ctex_ziju_dim }
    \dim_compare:nNnTF \ccwd > \c_zero_dim
      {
        \dim_set:Nn \l__ctex_tmp_dim
          { \linewidth - \ccwd + \l__ctex_ziju_dim }
        \int_set:Nn \l__ctex_tmp_int { \l__ctex_tmp_dim }
        \tex_divide:D \l__ctex_tmp_int \ccwd
        \dim_sub:Nn \l__ctex_tmp_dim { \l__ctex_tmp_int \ccwd }
        \dim_compare:nNnF \parindent = \c_zero_dim
          {
            \int_compare:nNnF \l__ctex_tmp_int < 3
              { \int_sub:Nn \l__ctex_tmp_int { 2 } }
          }
        \skip_set:Nn \l__ctex_ccglue_skip
          {
            \l__ctex_ziju_dim
            plus  \dim_eval:n { \l__ctex_tmp_dim / \l__ctex_tmp_int }
            minus \dim_min:nn { \dim_abs:n { \l__ctex_ziju_dim } }
              { ( \ccwd - \l__ctex_tmp_dim ) / ( \l__ctex_tmp_int + 1 ) }
          }
      }
      { \skip_set:Nn \l__ctex_ccglue_skip { \l__ctex_ziju_dim } }
    \ctex_update_ccglue:
    \ctex_update_parindent:
  }
\dim_new:N \l__ctex_ziju_dim
\NewDocumentCommand \CTEXindent { }
  {
    \ctex_deprecated_command:Nn \CTEXindent
      { \parindent is~set~to~2\ccwd. }
    \ctex_update_ccwd:
    \dim_set:Nn \parindent { 2 \ccwd }
  }
\NewDocumentCommand \CTEXnoindent { }
  {
    \ctex_deprecated_command:Nn \CTEXnoindent
      { \parindent is~set~to~0pt. }
    \dim_zero:N \parindent
  }
\PassOptionsToPackage { encoding = \g__ctex_encoding_tl } { zhnumber }
\RequirePackage { zhnumber }
\cs_new:Npn \chinese { \zhnum_counter:n }
\cs_new_eq:NN \@chinese \@zhnum
\cs_new_eq:NN \Chinese \chinese
\cs_new_eq:NN \CTEXcounter \use_none:n
\ctex_at_end_package:nn { enumitem }
  {
    \cs_if_free:NF \AddEnumerateCounter
      {
        \AddEnumerateCounter * { \zhnum }   { \@zhnum } { 1 }
        \AddEnumerateCounter * { \zhdig }   { \@zhdig } { 1 }
        \AddEnumerateCounter * { \chinese } { \@chinese } { 1 }
      }
  }
\NewDocumentCommand \CTEXnumber { m m }
  { \protected@edef #1 { \zhnumber {#2} } }
\NewDocumentCommand \CTEXdigits { m m }
  { \protected@edef #1 { \zhdigits {#2} } }
\cs_set_eq:NN \CTEX@todayold \today
\ctex_define:n
  {
    today .choice: ,
    today / old     .code:n =
      { \cs_set_eq:NN \today \CTEX@todayold } ,
    today / small   .code:n =
      {
        \cs_set_eq:NN \today \zhtoday
        \zhnumsetup { time = Arabic }
      } ,
    today / big     .code:n =
      {
        \cs_set_eq:NN \today \zhtoday
        \zhnumsetup { time = Chinese }
      } ,
    today / unknown .code:n =
      { \msg_error:nnx { ctex } { today-undef } {#1} }
  }
\msg_new:nnnn { ctex } { today-undef }
  { Today~format~`#1'~is~undefined. }
  { Available~today~formats~are~`old',~`small',~and~`big'. }
\tl_if_exist:NF \proofname
  {
    \tl_new:N \proofname
    \tl_set:Nn \proofname { Proof }
  }
\ctex_define:n
  {
    contentsname   .tl_set:N = \contentsname ,
    listfigurename .tl_set:N = \listfigurename ,
    listtablename  .tl_set:N = \listtablename ,
    figurename     .tl_set:N = \figurename ,
    tablename      .tl_set:N = \tablename ,
    abstractname   .tl_set:N = \abstractname ,
    indexname      .tl_set:N = \indexname ,
    appendixname   .tl_set:N = \appendixname ,
    proofname      .tl_set:N = \proofname ,
    algorithmname  .tl_set:N = \algorithmname ,
    bibname        .tl_set:N = \bibname ,
    refname        .tl_set:N = \refname ,
    continuation   .tl_set:N = \insertcontinuationtext
  }
\seq_const_from_clist:Nn \c__ctex_headings_seq
  { part , section , subsection }
\cs_new_protected:Npn \__ctex_initial_heading:n #1
  {
    \tl_new:c { CTEX@pre#1 }
    \tl_new:c { CTEX@post#1 }
    \tl_const:cx { CTEXthe#1 }
      {
        \exp_not:c { CTEX@pre#1 }
        \exp_not:c { CTEX@the#1 }
        \exp_not:c { CTEX@post#1 }
      }
    \tl_const:cx { CTEX@#1name }
      {
        \group_begin:
          \exp_not:c { CTEX@#1@nameformat }
            {
              \exp_not:c { CTEX@pre#1 }
              \exp_not:N \tl_if_empty:NTF
              \exp_not:c { CTEX@#1@numberformat }
                { \exp_not:c { CTEX@the#1 } }
                {
                  \group_begin:
                    \exp_not:c { CTEX@#1@numberformat }
                    \exp_not:c { CTEX@the#1 }
                  \group_end:
                }
              \exp_not:c { CTEX@post#1 }
            }
        \group_end:
      }
  }
\cs_new_protected:Npn \__ctex_def_heading_keys:n #1
  {
    \tl_put_right:Nx \l__ctex_tmp_tl
      {
        #1                  .meta:nn = { ctex / #1 } { ####1 } ,
        #1 / name            .code:n =
          { \ctex_assign_heading_name:nn {#1} { ####1 } } ,
        #1 / number        .tl_set:N = \exp_not:c { CTEX@the#1 } ,
        #1 / beforeskip    .tl_set:N = \exp_not:c { CTEX@#1@beforeskip } ,
        #1 / afterskip     .tl_set:N = \exp_not:c { CTEX@#1@afterskip} ,
        #1 / indent        .tl_set:N = \exp_not:c { CTEX@#1@indent } ,
        #1 / numbering   .bool_set:N = \exp_not:c { CTEX@#1@numbering } ,
        #1 / numbering    .initial:n = true ,
        #1 / beforeskip   .initial:n = \c_zero_skip ,
        #1 / afterskip    .initial:n = \c_zero_skip ,
        #1 / indent       .initial:n = \c_zero_dim ,
        #1 / beforeskip   .value_required:n = true ,
        #1 / afterskip    .value_required:n = true ,
        #1 / indent       .value_required:n = true ,
        \__ctex_plus_key_aux:nn {#1} { format } ,
        \__ctex_plus_key_aux:nn {#1} { nameformat } ,
        \__ctex_plus_key_aux:nn {#1} { numberformat } ,
        \__ctex_plus_key_aux:nn {#1} { titleformat } ,
        \__ctex_plus_key_aux:nn {#1} { aftername } ,
        \__ctex_plus_key_aux:nn {#1} { aftertitle } ,
      }
  }
\cs_new:Npn \__ctex_plus_key_aux:nn #1#2
  {
    #1 / #2   .tl_set:N = \exp_not:c { CTEX@#1@#2 } ,
    #1 / #2 +   .code:n =
      { \tl_put_right:Nn \exp_not:c { CTEX@#1@#2 } { ####1 } } ,
    #1 / #2 ~ + .code:n =
      { \tl_put_right:Nn \exp_not:c { CTEX@#1@#2 } { ####1 } }
  }
\NewDocumentCommand \ctex_assign_heading_name:nn
  { m > { \SplitArgument { 1 } { , } } +m }
  { \__ctex_assign_heading_name:nnn {#1} #2 }
\cs_new_protected:Npn \__ctex_assign_heading_name:nnn #1#2#3
  {
    \tl_set:cn { CTEX@pre#1 } {#2}
    \tl_if_novalue:nTF {#3}
      { \tl_clear:c { CTEX@post#1 } }
      { \tl_set:cn { CTEX@post#1 } {#3} }
  }
\group_begin:
\tl_clear:N \l__ctex_tmp_tl
\seq_map_inline:Nn \c__ctex_headings_seq
  {
    \__ctex_initial_heading:n {#1}
    \__ctex_def_heading_keys:n {#1}
  }
\exp_args:NNo \group_end: \ctex_define:n { \l__ctex_tmp_tl }
\cs_new_protected:Npn \CTEX@heading@format@initial
  {
    \normalfont
    \tl_clear:N \l__ctex_autoindent_tl
    \int_set:Nn \tex_interlinepenalty:D { 10 000 }
    \tex_noindent:D
  }
\cs_new_protected:Npn \ctex_indent_box:n #1
  {
    \dim_set:Nn \tex_parindent:D {#1}
    \__ctex_insert_indent:
  }
\cs_new_protected:Npn \__ctex_insert_indent:
  {
    \dim_compare:nNnF \tex_parindent:D = \c_zero_dim
      { \tex_indent:D }
  }
\cs_new_eq:NN \CTEX@indentbox \ctex_indent_box:n
\ExplSyntaxOff
\defbeamertemplate*{part page}{CTEX}[1][]{%
  \begingroup
    \par \addvspace{\glueexpr\CTEX@part@beforeskip\relax}%
    \CTEX@heading@format@initial
    \CTEX@part@format{%
      \CTEX@indentbox{\CTEX@part@indent}%
      \ifodd \CTEX@part@numbering
        \CTEX@partname \CTEX@part@aftername
      \fi
      \begin{beamercolorbox}[sep=16pt,center,#1]{part title}
        \CTEX@part@titleformat \insertpart \CTEX@part@aftertitle
      \end{beamercolorbox}}%
    \par \addvspace{\glueexpr\CTEX@part@afterskip\relax}%
  \endgroup}
\defbeamertemplate*{section page}{CTEX}[1][]{%
  \begingroup
    \par \addvspace{\glueexpr\CTEX@section@beforeskip\relax}%
    \CTEX@heading@format@initial
    \CTEX@section@format{%
      \CTEX@indentbox{\CTEX@section@indent}%
      \ifodd \CTEX@section@numbering
        \CTEX@sectionname \CTEX@section@aftername
      \fi
      \begin{beamercolorbox}[sep=12pt,center,#1]{part title}
        \CTEX@section@titleformat \insertsection \CTEX@section@aftertitle
      \end{beamercolorbox}}%
    \par \addvspace{\glueexpr\CTEX@section@afterskip\relax}%
  \endgroup}
\defbeamertemplate*{subsection page}{CTEX}[1][]{%
  \begingroup
    \par \addvspace{\glueexpr\CTEX@subsection@beforeskip\relax}%
    \CTEX@heading@format@initial
    \CTEX@subsection@format{%
      \CTEX@indentbox{\CTEX@subsection@indent}%
      \ifodd \CTEX@subsection@numbering
        \CTEX@subsectionname \CTEX@subsection@aftername
      \fi
      \begin{beamercolorbox}[sep=8pt,center,#1]{part title}
        \CTEX@subsection@titleformat \insertsubsection \CTEX@subsection@aftertitle
      \end{beamercolorbox}}%
    \par \addvspace{\glueexpr\CTEX@subsection@afterskip\relax}%
  \endgroup}
\defbeamertemplatealias{part page}{default}{CTEX}
\defbeamertemplatealias{section page}{default}{CTEX}
\defbeamertemplatealias{subsection page}{default}{CTEX}
\ExplSyntaxOn
\cs_new_protected:Npn \CTEX@setcurrentlabel@n #1
  {
    \protected@edef \@currentlabel
      {
        \cs_if_exist:cTF { CTEX@the#1 }
          { \exp_args:cc { p@#1 } { CTEX@the#1 } }
          { \exp_not:o { \@currentlabel } }
      }
  }
\cs_new_protected:Npn \ctex_varioref_hook:
  {
    \seq_map_inline:Nn \c__ctex_headings_seq
      { \ctex_fix_varioref_label:n { ##1 } }
  }
\cs_new_protected:Npn \ctex_fix_varioref_label:n #1
  {
    \tl_if_empty:cT { p@#1 }
      { \exp_args:Nnx \labelformat {#1} { \exp_not:c { CTEX@the#1 } } }
  }
\cs_if_exist:NTF \labelformat
  { \ctex_varioref_hook: }
  {
    \cs_new_eq:NN \CTEX@save@refstepcounter \refstepcounter
    \RenewDocumentCommand \refstepcounter { m }
      {
        \CTEX@save@refstepcounter {#1}
        \CTEX@setcurrentlabel@n {#1}
      }
    \ctex_at_end_package:nn { varioref } { \ctex_varioref_hook: }
  }
\ctex_scheme_input:o { \l__ctex_scheme_tl }
\NewDocumentCommand \zihao { m }
  { \exp_args:Nx \ctex_zihao:n {#1} \tex_ignorespaces:D }
\cs_new_protected:Npn \ctex_zihao:n #1
  {
    \prop_get:NnNTF \c__ctex_font_size_prop {#1} \l__ctex_font_size_tl
      { \exp_after:wN \fontsize \l__ctex_font_size_tl \selectfont }
      { \msg_error:nnn { ctex } { fontsize } {#1} }
  }
\msg_new:nnnn { ctex } { fontsize }
  { Undefined~Chinese~font~size~`#1'~in~command~\token_to_str:N \zihao.}
  {
    The~old~font~size~is~used~if~you~continue.\\
    The~available~font~sizes~are~listed~as~follow.\\
    \seq_use:Nnnn \c__ctex_font_size_seq { ~and~ } { ,~ } { ,~and~ }.
  }
\prop_new:N \c__ctex_font_size_prop
\seq_new:N \c__ctex_font_size_seq
\cs_new_protected:Npn \__ctex_save_font_size:nn #1#2
  {
    \use:x
      {
        \prop_gput:Nnn \exp_not:N \c__ctex_font_size_prop {#1}
          {
            { \dim_to_decimal:n {#2} }
            { \dim_to_decimal:n { (#2) * 6 / 5 } }
          }
      }
    \seq_gput_right:Nn \c__ctex_font_size_seq {#1}
  }
\clist_map_inline:nn
  {
    {  8 } { 5    bp } ,
    {  7 } { 5.5  bp } ,
    { -6 } { 6.5  bp } ,
    {  6 } { 7.5  bp } ,
    { -5 } { 9    bp } ,
    {  5 } { 10.5 bp } ,
    { -4 } { 12   bp } ,
    {  4 } { 14   bp } ,
    { -3 } { 15   bp } ,
    {  3 } { 16   bp } ,
    { -2 } { 18   bp } ,
    {  2 } { 22   bp } ,
    { -1 } { 24   bp } ,
    {  1 } { 26   bp } ,
    { -0 } { 36   bp } ,
    {  0 } { 42   bp }
  }
  { \__ctex_save_font_size:nn #1 }
\cs_new_protected:Npn \ctex_declare_math_sizes:nnnn #1#2#3#4
  {
    \__ctex_get_font_sizes:Nn \l__ctex_font_size_tl { {#1} {#2} {#3} {#4} }
    \exp_after:wN \DeclareMathSizes \l__ctex_font_size_tl
  }
\cs_new_protected:Npn \__ctex_get_font_sizes:Nn #1#2
  {
    \tl_clear:N #1
    \tl_map_inline:nn {#2}
      {
        \prop_get:NnNTF \c__ctex_font_size_prop {##1} \l__ctex_tmp_tl
          { \tl_put_right:Nx #1 { { \tl_head:N \l__ctex_tmp_tl } } }
          { \tl_put_right:Nx #1 { { \dim_to_decimal:n { ##1 } } } }
      }
  }
\clist_map_inline:nn
  {
    {  8 }{  8 }{ 5pt }{ 5pt } ,
    {  7 }{  7 }{ 5pt }{ 5pt } ,
    { -6 }{ -6 }{ 5pt }{ 5pt } ,
    {  6 }{  6 }{ 5pt }{ 5pt } ,
    { -5 }{ -5 }{ 6pt }{ 5pt } ,
    {  5 }{  5 }{ 7pt }{ 5pt } ,
    { -4 }{ -4 }{ 8pt }{ 6pt } ,
    {  4 }{  4 }{  5 }{  6 } ,
    { -3 }{ -3 }{ -4 }{ -5 } ,
    {  3 }{  3 }{  4 }{  5 } ,
    { -2 }{ -2 }{ -3 }{ -4 } ,
    {  2 }{  2 }{  3 }{  4 } ,
    { -1 }{ -1 }{ -2 }{ -3 } ,
    {  1 }{  1 }{  2 }{  3 } ,
    { -0 }{ -0 }{ -1 }{ -2 } ,
    {  0 }{  0 }{  1 }{  2 }
  }
  { \ctex_declare_math_sizes:nnnn #1 }
\cs_new_protected:Npn \ctex_set_font_size:Nnn #1#2#3
  {
    \prop_get:NnNTF \c__ctex_font_size_prop {#2} \l__ctex_font_size_tl
      { \exp_after:wN \__ctex_set_font_size:nnNn \l__ctex_font_size_tl #1 {#3} }
      { \msg_error:nnn { ctex } { fontsize } {#2} }
  }
\cs_new_protected:Npn \__ctex_set_font_size:nnNn #1#2#3#4
  { \cs_set_protected:Npn #3 { \@setfontsize #3 {#1} {#2} #4 } }
\int_case:nn { \g__ctex_font_size_int }
  {
    { 0 } { \ctex_file_input:n { ctex-c5size.clo } }
    { 1 } { \ctex_file_input:n { ctex-cs4size.clo } }
  }
\fp_if_nan:nF { \l__ctex_line_spread_fp }
  {
    \exp_args:Nx \linespread { \fp_use:N \l__ctex_line_spread_fp }
    \group_begin: \footnotesize \exp_args:NNNo \group_end:
    \dim_set:Nn \footnotesep { \dim_use:N \box_ht:N \strutbox }
  }
\normalsize
\NewDocumentCommand \CTeX { }
  { C \TeX }
\ctex_at_end_package:nn { hyperref }
  { \pdfstringdefDisableCommands { \tl_set:Nn \CTeX { CTeX } } }
\ctex_define:n
  {
    captiondelimiter .code:n =
      {
        \ctex_deprecated_option:n
          { You~can~load~the~package~`caption'~to~get~its~functionality. }
      }
  }
\cs_new_protected:Npn \ctex_fontset_error:n #1
  { \msg_critical:nnn { ctex } { fontset-unavailable } {#1} }
\msg_new:nnn { ctex } { fontset-unavailable }
  { CTeX~fontset~`#1'~is~unavailable~in~current~mode. }
\cs_new:Npx \ctex_fontset_case:nnn #1#2#3
  {
    \sys_if_engine_pdftex:TF
      {#1}
      { \sys_if_engine_uptex:TF {#2} {#3} }
  }
\cs_new:Npx \ctex_fontset_case:nnnn #1#2#3#4
  {
    \sys_if_engine_pdftex:TF
      { \sys_if_output_pdf:TF   {#1} {#2} }
      { \sys_if_engine_uptex:TF {#3} {#4} }
  }
\cs_new_protected:Npn \ctex_detect_platform:
  {
    \sys_if_platform_windows:TF
      { \tl_gset:Nn \g__ctex_fontset_tl { windows } }
      {
        \ctex_if_platform_macos:TF
          { \tl_gset:Nn \g__ctex_fontset_tl { mac    } }
          { \tl_gset:Nn \g__ctex_fontset_tl { fandol } }
      }
  }
\cs_new_protected:Npn \ctex_if_platform_macos:TF
  { \file_if_exist:nTF { /System/Library/Fonts/Menlo.ttc } }
\cs_new_protected:Npn \ctex_load_fontset:
  {
    \tl_if_empty:NTF \g__ctex_fontset_tl
      { \ctex_detect_platform: }
      {
        \bool_lazy_or:nnTF
          { \str_if_eq_p:on { \g__ctex_fontset_tl } { windowsnew } }
          { \str_if_eq_p:on { \g__ctex_fontset_tl } { windowsold } }
          {
            \msg_warning:nnxx { ctex } { deprecated-fontset }
              { \g__ctex_fontset_tl } { windows }
            \tl_gset:Nn \g__ctex_fontset_tl { windows }
          }
          {
            \file_if_exist:nF { ctex-fontset- \g__ctex_fontset_tl .def }
              {
                \use:x
                  {
                    \ctex_detect_platform:
                    \msg_error:nnxx { ctex } { fontset-not-found }
                      { \g__ctex_fontset_tl } { \exp_not:N \g__ctex_fontset_tl }
                  }
              }
          }
      }
    \ctex_file_input:n { ctex-fontset- \g__ctex_fontset_tl .def }
  }
\msg_new:nnn { ctex } { deprecated-fontset }
  { CTeX~fontset~`#1'~is~deprecated.\\ Fontset~`#2'~will~be~used~instead. }
\msg_new:nnnn { ctex } { fontset-not-found }
  { CTeX~fontset~`#1'~could~not~be~found.\\ Fontset~`#2'~will~be~used~instead. }
  { You~may~run~`mktexlsr'~firstly. }
\@onlypreamble \ctex_load_fontset:
\ctex_define:n
  {
    fontset .code:n =
      {
        \ctex_if_preamble:TF
          {
            \str_if_eq:eeTF {#1} { none }
              { \msg_warning:nnn { ctex } { invalid-value } {#1} }
              {
                \str_if_eq:onTF { \g__ctex_fontset_tl } { none }
                  {
                    \tl_gset:Nx \g__ctex_fontset_tl {#1}
                    \ctex_load_fontset:
                  }
                  {
                    \msg_error:nnxx { ctex } { fontset-loaded }
                      { \g__ctex_fontset_tl } {#1}
                  }
              }
          }
          { \msg_error:nn { ctex } { fontset-only-preamble } }
      }
  }
\msg_new:nnnn { ctex } { fontset-loaded }
  {
    CTeX~fontset~`#1'~has~been~loaded.
    \str_if_eq:nnF {#1} {#2} { \\ Fontset~`#2'~will~be~ignored. }
  }
  { Only~one~fontset~can~be~loaded~in~the~preamble. }
\msg_new:nnn { ctex } { fontset-only-preamble }
  { The~`fontset'~option~can~be~used~only~in~preamble. }
\str_if_eq:onF { \g__ctex_fontset_tl } { none }
  { \ctex_load_fontset: }
\ctex_at_end:n { \ctex_file_input:n { ctex.cfg } }
%% 
%%     This package consists of the files ctex.dtx,
%%                                        ctxdoc.cls,
%%                                        ctxdocstrip.tex,
%%                                        ctex-zhconv.lua,
%%                                        ctex-zhconv-make.lua,
%%                  and the derived files ctex.pdf,
%%                                        ctex.ins,
%%                                        ctex.sty,
%%                                        ctexsize.sty,
%%                                        ctexheading.sty,
%%                                        ctexart.cls,
%%                                        ctexbook.cls,
%%                                        ctexrep.cls,
%%                                        ctexbeamer.cls,
%%                                        ctexcap.sty,
%%                                        ctexhook.sty,
%%                                        ctexpatch.sty,
%%                                        ctex-c5size.clo,
%%                                        ctex-cs4size.clo,
%%                                        ctex-heading-article.def,
%%                                        ctex-heading-book.def,
%%                                        ctex-heading-report.def,
%%                                        ctex-heading-beamer.def,
%%                                        ctex-scheme-plain.def,
%%                                        ctex-scheme-plain-article.def,
%%                                        ctex-scheme-plain-book.def,
%%                                        ctex-scheme-plain-report.def,
%%                                        ctex-scheme-plain-beamer.def,
%%                                        ctex-scheme-chinese.def,
%%                                        ctex-scheme-chinese-article.def,
%%                                        ctex-scheme-chinese-book.def,
%%                                        ctex-scheme-chinese-report.def,
%%                                        ctex-scheme-chinese-beamer.def,
%%                                        ctex-name-gbk.cfg,
%%                                        ctex-name-utf8.cfg,
%%                                        ctex.cfg,
%%                                        ctexopts.cfg,
%%                                        ctexbackend.cfg,
%%                                        ctex-engine-pdftex.def,
%%                                        ctex-engine-xetex.def,
%%                                        ctex-engine-luatex.def,
%%                                        ctex-engine-aptex.def,
%%                                        ctex-engine-uptex.def,
%%                                        c19rm.fd,
%%                                        c19sf.fd,
%%                                        c19tt.fd,
%%                                        c70rm.fd,
%%                                        c70sf.fd,
%%                                        c70tt.fd,
%%                                        jy2zhrm.fd,
%%                                        jy2zhsf.fd,
%%                                        jy2zhtt.fd,
%%                                        jt2zhrm.fd,
%%                                        jt2zhsf.fd,
%%                                        jt2zhtt.fd,
%%                                        ctex-fontset-adobe.def,
%%                                        ctex-fontset-fandol.def,
%%                                        ctex-fontset-founder.def,
%%                                        ctex-fontset-mac.def,
%%                                        ctex-fontset-macnew.def,
%%                                        ctex-fontset-macold.def,
%%                                        ctex-fontset-ubuntu.def,
%%                                        ctex-fontset-windows.def,
%%                                        ctexspa.def,
%%                                        ctexpunct.spa,
%%                                        ctexmakespa.tex,
%%                                        ctexspamacro.tex,
%%                                        zhadobefonts.tex,
%%                                        zhfandolfonts.tex,
%%                                        zhfounderfonts.tex,
%%                                        zhmacfonts.tex,
%%                                        zhubuntufonts.tex,
%%                                        zhwindowsfonts.tex,
%%                                        ctex-zhconv-index.lua,
%%                                        translator-theorem-dictionary-ChineseGBK.dict,
%%                                        translator-theorem-dictionary-ChineseUTF8.dict, and
%%                                        README.md.
%%
%% End of file `ctexbeamer.cls'.
