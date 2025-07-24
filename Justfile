# Nix cleanup commands

# Delete profiles older than 7 days and clean cache
clean:
    nix-collect-garbage --delete-older-than 7d
    nix store gc

# Apply home-manager configuration
apply:
    home-manager switch

# List current generations
list:
    nix-env --list-generations

# Optimize store (may take time)
opt:
    nix store optimise
