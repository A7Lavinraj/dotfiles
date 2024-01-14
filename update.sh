rm nvim -rf
rm alacritty -rf
rm .tmux.conf

cp ~/.config/nvim/ nvim -r
cp ~/.config/alacritty/ alacritty -r
cp ~/.tmux.conf .tmux.conf

git add --all && git commit --amend -m "feat: update config" && git push --force
