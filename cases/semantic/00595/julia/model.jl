#= 
    This code was generated by heta-compiler of v0.5.8
    
=#

module julia 
using SimSolver

### create default constants
constants_ = NamedTuple{(
  :k__reaction1_local,:k__reaction2_local,
)}(Float64[
  1,2,
])

### initialization of ODE variables and Records
function start_(cons)
    #(k__reaction1_local,k__reaction2_local,) = cons

    # Heta initialize
    t = 0.0 # initial time
    S3 = 0.0
    C = 1.0
    S1 = 0.003
    reaction1 = C * cons[1] * S1
    S2 = 0.0
    reaction2 = C * cons[2] * S2
    
    # save results

    return (
        [
            S1 * C,
            S2 * C,
            S3 * C,
        ],
        
        [
            C,
        ]
    )
end

### calculate RHS of ODE
function ode_(du, u, p, t)
    cons = p.constants
    (C,) = p.static
    (S1_,S2_,S3_,) = u 

    # Heta rules
    S3 = S3_ / C
    S1 = S1_ / C
    reaction1 = C * cons[1] * S1
    S2 = S2_ / C
    reaction2 = C * cons[2] * S2
    
    #p.static .= [C,]
    du .= [
      -reaction1,  # dS1_/dt
      reaction1-reaction2,  # dS2_/dt
      reaction2,  # dS3_/dt
    ]
end

### output function
function make_saving_(outputIds::Vector{Symbol})
    function saving_(u, t, integrator)
        cons = integrator.p.constants
        (C,) = integrator.p.static
        (S1_,S2_,S3_,) = u

        # Heta rules
        S3 = S3_ / C
        S1 = S1_ / C
        reaction1 = C * cons[1] * S1
        S2 = S2_ / C
        reaction2 = C * cons[2] * S2
        
        # calculate amounts
        C_ = C
        reaction1_ = reaction1
        reaction2_ = reaction2

        d = Base.@locals
        return [d[id] for id in outputIds]
    end
end

### time events

### discrete events


### continous events


### event assignments


### OUTPUT ###

x00595 = Model(
  start_,
  ode_,
  [
  ],
  make_saving_,
  constants_
)

models = (
    x00595 = x00595
)
tasks = ()

export models, tasks

end
