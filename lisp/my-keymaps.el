(require 'key-chord)

(global-set-key (kbd "M-]") 'next-buffer)
(global-set-key (kbd "M-[") 'previous-buffer)

(key-chord-define-global "bw" 'previous-buffer)
(key-chord-define-global "bs" 'next-buffer)


;;(key-chord-mode +1)

(provide 'my-keymaps)
