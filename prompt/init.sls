# Linux prompt setup
# Setting prompt is implemented by creating /etc/profile.d/prompt.sh. Every user can have different prompt
linux:
  system:
    prompt:
      root: \\n\\[\\033[0;37m\\]\\D{%y/%m/%d %H:%M:%S} $(hostname -f)\\[\\e[0m\\]\\n\\[\\e[1;31m\\][\\u@\\h:\\w]\\[\\e[0m\\]
      default: \\n\\D{%y/%m/%d %H:%M:%S} $(hostname -f)\\n[\\u@\\h:\\w]