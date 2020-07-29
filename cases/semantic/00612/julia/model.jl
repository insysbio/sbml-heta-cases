#= 
    This code was generated by heta-compiler of v0.5.8
    
=#

module julia 
using SimSolver

### create default constants
constants_ = NamedTuple{(
  :k__reaction1_local,:k__reaction2_local,
)}(Float64[
  15000,5,
])

### initialization of ODE variables and Records
function start_(cons)
    #(k__reaction1_local,k__reaction2_local,) = cons

    # Heta initialize
    t = 0.0 # initial time
    k = 1.5
    C = 1.0
    S2 = 1.5e-5 / C
    S4 = k * S2
    S1 = 1e-5 / C
    reaction1 = C * cons[1] * S1 * S2
    S3 = 1e-5 / C
    reaction2 = C * cons[2] * S3
    
    # save results

    return (
        [
            S1 * C,
            S2 * C,
            S3 * C,
        ],
        
        [
            C,
            k,
        ]
    )
end

### calculate RHS of ODE
function ode_(du, u, p, t)
    cons = p.constants
    (C,k,) = p.static
    (S1_,S2_,S3_,) = u 

    # Heta rules
    S2 = S2_ / C
    S4 = k * S2
    S1 = S1_ / C
    reaction1 = C * cons[1] * S1 * S2
    S3 = S3_ / C
    reaction2 = C * cons[2] * S3
    
    #p.static .= [C,k,]
    du .= [
      -reaction1+reaction2,  # dS1_/dt
      -reaction1+reaction2,  # dS2_/dt
      reaction1-reaction2,  # dS3_/dt
    ]
end

### output function
function make_saving_(outputIds::Vector{Symbol})
    function saving_(u, t, integrator)
        cons = integrator.p.constants
        (C,k,) = integrator.p.static
        (S1_,S2_,S3_,) = u

        # Heta rules
        S2 = S2_ / C
        S4 = k * S2
        S1 = S1_ / C
        reaction1 = C * cons[1] * S1 * S2
        S3 = S3_ / C
        reaction2 = C * cons[2] * S3
        
        # calculate amounts
        C_ = C
        S4_ = S4 * C
        reaction1_ = reaction1
        reaction2_ = reaction2
        k_ = k

        d = Base.@locals
        return [d[id] for id in outputIds]
    end
end

### time events

### discrete events


### continous events


### event assignments


### OUTPUT ###

x00612 = Model(
  start_,
  ode_,
  [
  ],
  make_saving_,
  constants_
)

models = (
    x00612 = x00612
)
tasks = ()

export models, tasks

end
