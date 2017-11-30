require 'rubygems'
require 'bundler'
require 'require_all'

Bundler.setup(:default)

welcome_message = <<EOS

                      `..,
                      ````,
                       ,,
                       ,.
                       ,.
                       ,.
                      ,..,
                     ,````.
                     ```....
         `,,,,,,,,,,,,,,,,,,,,,,,,,,,,.
         ```````````````````````````...,
        ,````````````````````````````...
        ,`````````````````````````````..`
        ,``````..``````````````.,.````..`
        ,`````,``..```````````:``.:```..`
        ,````.`::.```````````:`,:.`:``..`        #':::'+'  .###,  #::+, #::#
        ,```.`:``:`,`````````,.``.`:``..`        #  #; :# :#   #'  :#    #+
        ,```.`:``:`,`````````..``.`:``..`        #  #   # #     #   #'   #
        ,````..::,`.`````````:`:,,`:`...`        #  #   #`#     #:   #  #`
        ,````.````:``````````.,```:``...`        `  #    :#     #'   '#,#
        ,``````,,.`````````````::,```...`           #    :#     #'    ##
        ,```````````````````````````....`           #    `#     #.    :#
        ,``````,:::::::::::::::::```....`           #     #     #     :#
        ,`````..`````````````````:`.....`           #`    ;#   #;     +#
        ,`````,``````````````````:`.....`         +#''#    :###:     #''#,
        ,`````,``````````````````:......`
        ,`````,``````````````````:......`
        ,`````,````:::::::::::.``:......`
        ,``````:,,:::::::::::::,,,......`
        ,```````````````````````........
         .`````````````````````........,
          .,,,,,,::::::::::::::,,,,,,,`                       :'.               `';
                 `````````````.                  '##;:'#`   ;#:.##  '+#'::#'   ##.:#'  #'+##'##
                 `````````````.                   ''   ,#   #    +#   #    #  '#    #` #  #   #
            ......:::::::::::::.....`             ''   `#  ++     #   #    #  #     ;# #  #   #
           ,`````````````````````....             ''  .#`  #,     #   #..:#.  #     `# '  #   +
           ,```````````````````````..             '####:   #.     #   #,..#+  #      #    #
          ,,```````````````````````..,`           ''   # ;.#:     #   #    #; #     .#    #
         .`,`.,`:`,.```````````````..,.           ''   # '.;#    `#   #    '# #.    #;    #
        `,,,``,`,`,.```````````````..,,:          '+   # +. #`   #,   #    #` .#   `#     #
        .::,``.........```````````...:::        .####. +##  `####'  #######,   '####`   #####
        ...,``.........``````````....,.:
        .``,`.,,,,,,,,,`````````.....,`:
        ...,``.........````````......,.:
        .::,`.,,,,,,,,,```````.......:::
        .::,`````````````````........:::
        ...,`````````````````........,.:
        .``:..................,.....,,`:
        ...       ,.,       ,.,      ,.:
        .,:`      ,.,       ,.,      :,:
       ..```.     ,.,       ,.,     .```,
       ., ``.     ,.,       ,.,    ,`. ,..
       ,,  ,,    ,,:,       ,:,,`  ,,   ,,
               `.```:       :```.,
               ..````       `````.
               ,,,,,,`     `,,,,,,.

Robot initializing...
EOS
puts welcome_message
