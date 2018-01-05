default['sublime_text']['state'] = :present

default['sublime_text']['users'] = [] # List of users for who sublime-text will be installed & configured

default['sublime_text']['repo']['uri'] = 'https://download.sublimetext.com/'
default['sublime_text']['repo']['key']['url'] = 'https://download.sublimetext.com/sublimehq-pub.gpg'
default['sublime_text']['repo']['distribution'] = 'apt/stable/'

default['sublime_text']['packages'] = [
  'Jinja2',
  'Package Control',
  'Pylinter',
  'SublimeLinter-contrib-ansible-lint',
  'SublimeLinter-pylint',
  'SummitLinter',
  'Terraform',
  'Neon Color Scheme',
]

default['sublime_text']['syntax_specific'] = {
  'JSON' => {
    'color_scheme' => '"Packages/Neon Color Scheme/Neon.tmTheme"',
  },
  'Python' => {
    'tab_size' => 4,
    'translate_tabs_to_spaces' => true,
  },
  'Ruby' => {
    'tab_size' => 2,
    'translate_tabs_to_spaces' => true,
  },
  'Ruby Haml' => {
    'tab_size' => 2,
    'translate_tabs_to_spaces' => true,
  },
}
