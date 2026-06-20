# Codex Starter Pack for Web Development

ეს საქაღალდე არის საწყისი პაკეტი Codex-თან უფრო ეფექტურად სამუშაოდ, განსაკუთრებით HTML, CSS, JavaScript, PHP და SQL პროექტებზე.

## რა არის აქ

- `AGENTS.md` - ძირითადი ინსტრუქცია, რომელიც შეგიძლია ჩააგდო ნებისმიერი ვებ-პროექტის root-ში.
- `.agents/skills/` - repo-scoped Codex skills კონკრეტული workflow-ებისთვის.
- `.codex/config.example.toml` - MCP სერვერების რეკომენდებული კონფიგურაციის ნიმუში.
- `docs/mcp-and-skills-research.md` - მოძიებული MCP/skill რეკომენდაციები და წყაროები.
- `docs/github-management.md` - GitHub/GitHub Pages მართვის გეგმა შენი სიტუაციისთვის.
- `docs/starter-pack-changelog.md` - რა შეიცვალა starter pack-ში და რატომ.
- `docs/clone-and-install.md` - როგორ დაკლონო და დააყენო starter pack სხვა პროექტში.
- `docs/setup-checklist.md` - დაყენების სწრაფი ნაბიჯები.
- `templates/` - prompt-ებისა და პროექტის ინსტრუქციების ასლები.

## როგორ გამოიყენო

1. ახალ ან არსებულ პროექტში დააკოპირე `AGENTS.md`.
2. თუ გინდა კონკრეტული skills იმ პროექტშიც იმუშაოს, დააკოპირე `.agents/skills`.
3. `.codex/config.example.toml`-დან მხოლოდ საჭირო MCP სერვერები გადაიტანე შენს `~/.codex/config.toml` ფაილში.
4. MCP-ები ჩართე ნელა და მიზნობრივად: ჯერ docs/browser/GitHub, შემდეგ მონაცემთა ბაზა მხოლოდ read-only რეჟიმით.

## რეკომენდებული მინიმუმი

- `AGENTS.md` ყველა ვებ-პროექტში.
- Context7 ან OpenAI Docs MCP დოკუმენტაციისთვის.
- Playwright MCP ან Codex in-app browser ფრონტენდის შესამოწმებლად.
- GitHub MCP მხოლოდ მაშინ, როცა issues/PR/actions-თან მუშაობა გინდა.
- DB MCP მხოლოდ dev/read-only ბაზებზე.
- GitHub Pages static საიტებისთვის; PHP საიტებისთვის GitHub გამოიყენე source control-ად და ჰოსტინგი ცალკე.
- PHP/SQL პროექტებზე მუშაობისას გამოიყენე XAMPP ლოკალურად, სანამ production hosting დაგჭირდება.

შენ მიერ მოცემული ChatGPT share ბმულის გახსნა tooling-ით ვერ დადასტურდა, ამიტომ პაკეტი ავაწყვე შენს აღწერაზე და ოფიციალურ/პოპულარულ წყაროებზე დაყრდნობით.
